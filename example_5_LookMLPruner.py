import pandas as pd
import lkml
import pprint as pp
#######
# Step 1. Run the Henry Command `henry vacuum explores --host IDENTIFIER_FROM_CONFIG --path PATH_TO_CONFIG.yml --output /PATH_TO_OUTPUT.csv --plain`
henryOutput = '/Users/hugoselbie/looker_stuff/henry_joinupdate/hugo1.csv'

henry = pd.read_csv(henryOutput)
un = henry['unused_fields'].tolist()

unusedFields = henry['unused_fields'].str.split("\\n", n= 2, expand = True) 
henry['newunused'] = unusedFields[0]
# cleanFields = henry['newunused'].str.split(".", n= 1, expand = True) 
# henry['unUsedViews'] = cleanFields[0]
# henry['unUsedFields'] = cleanFields[1]
# henry = henry.drop(['newunused','unused_fields'], axis=1)

# unusedFields = henry['unUsedFields'].tolist()
# unusedViews = henry['unUsedViews'].tolist()

uuf = henry['newunused'].tolist()

with open('/Users/hugoselbie/looker_stuff/code_sample/py/autogen_testing/join2019_demo/pruner_files/users.lkml', 'r') as file:
    parsed_view = lkml.load(file)
    dimensions = parsed_view['views'][0]['dimensions']
    measures = parsed_view['views'][0]['measures']
    dimension_groups = parsed_view['views'][0]['dimension_groups']

    for y in range(len(parsed_view['views'])):
        for each in parsed_view['views'][y].keys():
            values = parsed_view['views'][0][each]
            if each in ["dimensions","measures","dimension_groups"]:
            
                for number in range(len(values)):
                    each2=parsed_view['views'][0][each][number]
                    if parsed_view['views'][0]['name'] + "." + each2['name'] in uuf:
                        each2['hidden'] = "no"
                        print(each + ": " + parsed_view['views'][0]['name'] + "." + each2['name'] + " is unused so hiding...")
                    pp.pprint(each2)
