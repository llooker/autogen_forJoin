import pandas as pd
import lkml
import pprint as pp
#######
# Step 1. Run the Henry Command `henry vacuum explores --host IDENTIFIER_FROM_CONFIG --path PATH_TO_CONFIG.yml --output /PATH_TO_OUTPUT.csv --plain`
henryOutput = '/Users/hugoselbie/looker_stuff/henry_joinupdate/hugo1.csv'
lookml = '/Users/hugoselbie/looker_stuff/code_sample/py/autogen_testing/join2019_demo/pruner_files/users.lkml'
#######
# Step 2. Using the Pandas Library to clean the henry response and create a list of unused fields
henry = pd.read_csv(henryOutput)
un = henry['unused_fields'].tolist()

unusedFields = henry['unused_fields'].str.split("\\n", n= 2, expand = True) 
henry['newunused'] = unusedFields[0]

uuf = henry['newunused'].tolist()

#######
# Step 3. opening the lkml file using the lkml library to serialize lookml into JSON
with open(lookml, 'r') as file:
    parsed_view = lkml.load(file)
    dimensions = parsed_view['views'][0]['dimensions']
    measures = parsed_view['views'][0]['measures']
    dimension_groups = parsed_view['views'][0]['dimension_groups']

#######
# Step 4. Iterate over the serialized LookML and identifiying if there is a match between the henry unused dimensions and the lookml, add the hidden parameter to the JSON
    for y in range(len(parsed_view['views'])):
        for each in parsed_view['views'][y].keys():
            values = parsed_view['views'][0][each]
            if each in ["dimensions","measures","dimension_groups"]:
            
                for number in range(len(values)):
                    each2=parsed_view['views'][0][each][number]
                    if parsed_view['views'][0]['name'] + "." + each2['name'] in uuf:
                        parsed_view['views'][0][each][number]['hidden'] = "no"
                        print(each + ": " + parsed_view['views'][0]['name'] + "." + each2['name'] + " is unused so hiding...")

#######
# Step 5. Write amended JSON back to LookML
    with open(lookml+'_out', 'w+') as outfile:      
        lkml.dump(parsed_view, outfile)


    pp.pprint(parsed_view)
