




BUNDLE_PATH=<absolute path of basic_rnn.mag>

bazel run //magenta/models/basic_rnn:basic_rnn_generate -- \
--bundle_file=${BUNDLE_PATH} \
--output_dir=/tmp/basic_rnn/generated \
--num_outputs=10 \
--num_steps=128 \
--primer_melody="[60]"
