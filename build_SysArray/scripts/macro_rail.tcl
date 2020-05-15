create_rectangular_rings \
    -around core \
    -nets {VDD} \
    -left_segment_layer M5 \
    -right_segment_layer M5 \
    -top_segment_layer M6 \
    -bottom_segment_layer  M6 \
    -offsets absolute \
    -top_offset  -2.0 \
    -bottom_offset  -2.0 \
    -right_offset -4.0 \
    -left_offset  -4.0 \
    -left_segment_width  4 \
    -right_segment_width  4 \
    -top_segment_width  2 \
    -bottom_segment_width  2 \
    -extension_gap 4 \
    -extend_th \
    -extend_for_multiple_connections

create_rectangular_rings \
    -around core \
    -nets {VSS} \
    -left_segment_layer M5 \
    -right_segment_layer M5 \
    -top_segment_layer M6 \
    -bottom_segment_layer  M6 \
    -offsets absolute \
    -top_offset  -5.0 \
    -bottom_offset  -5.0 \
    -right_offset -9.0 \
    -left_offset  -9.0 \
    -left_segment_width  4 \
    -right_segment_width  4 \
    -top_segment_width  2 \
    -bottom_segment_width  2 \
    -extension_gap 4 \
    -extend_th \
    -extend_for_multiple_connections


