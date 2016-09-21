




BUNDLE_PATH=/home/ubuntu/workspace/magenta/trained-magenta/basic_rnn.mag

bazel run //magenta/models/basic_rnn:basic_rnn_generate -- \
--bundle_file=${BUNDLE_PATH} \
--output_dir=/tmp/basic_rnn/generated \
--num_outputs=1 \
--num_steps=640 \
--primer_melody="[60]"
