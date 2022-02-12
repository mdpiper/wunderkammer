"""Convert Exportify csv Spotify playlists to yaml."""
import os
import glob
import pandas
import yaml


csv_files = glob.glob("*.csv")

for playlist_file in csv_files:
    playlist_name, _ = os.path.splitext(playlist_file)
    yaml_file = 'yaml/{}.yaml'.format(playlist_name)
    print("- {}".format(yaml_file))

    playlist = pandas.read_csv(playlist_file)
    playlist_dict = playlist.to_dict('index')

    with open(yaml_file, 'w') as fp:
        fp.write('#\n# {}\n#\n'.format(playlist_name))
        yaml.safe_dump(playlist_dict, fp)
