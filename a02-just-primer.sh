#----------------------basic_rnn_generate----------------------------------------------------

#basic_rnn_generate Generates the output midi files
#--run_dir=location of the latest run and checkpoints
#--hparams=comma seperated list of hparameters
#--output_dir Directory for all your midi files to be generated into
#--num_steps Number of notes generated, more notes the longer the song is
#--num_outputs Number of midi files generated
#--temperature Randomness of outputted song. Default = 1, higher numbers for more random songs
#--bpm  Beats per minute for the output songs. Default 120 bpm
#--log-INFO is the default.Others in order are  DEBUG, INFO, WARN, ERROR, or FATAL 
#--primer_midi A small midi file that starts each outputted midi fie
#or
# --primer_melody Strange format for writing small midi style songs
#0r
#leave blank for the first note to be randomly generated



bazel run //magenta/models/basic_rnn:basic_rnn_generate -- \
--run_dir=/tmp/basic_rnn/logdir/run1 \
--hparams=$HPARAMS_SET \
--output_dir=/tmp/basic_rnn_generated \
--num_steps=640 \
--num_outputs=1 \
--temperature=1 \
--bpm=30 \
--log=DEBUG \
--primer_melody="[60, -2, 60, -2, 67, -2, 67, -2]"


#\
#--primer_midi=~/mymagenta/magenta/magenta/models/shared/primer.mid

# --primer_melody="[60, -2, 60, -2, 67, -2, 67, -2]"
