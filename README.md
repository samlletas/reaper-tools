# Reaper Tools

A collection of customized effects and scripts for [Reaper](https://www.reaper.fm/).

## Download & Install
Download the zip file from [here](https://github.com/samlletas/jsfx/archive/refs/heads/main.zip), extract
it and copy the `.jsfx` files to your Reaper `Effects` folder.

## Effects

### MIDI d'Arpagnan

Modified version of Jahudka's [d'Arpagnan Arpeggiator](https://github.com/jahudka/reaper-consolefx).
I added more patterns with several possible directions each, also removed the backtrack controls 
since I didn't use them that much. Velocity is no longer hardcoded and it can be modulated via a LFO.

![midi_darpagnan](https://github.com/samlletas/jsfx/assets/7089504/5a611bbe-d116-4dce-b67c-cc633018c41a)

## Development & Contributing

If a new parameter/slider is needed please add it after the previous ones to avoid breaking compatibility.

### Making Commits
All commits should be made using the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/#summary) specification, to help with this a git hook that validates commit messages can be installed with:

     cp -r -T .githooks .git/hooks
