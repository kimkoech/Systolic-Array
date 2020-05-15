template: m3_mesh(w1) {
layer : M3 {
direction : vertical
width : @w1
spacing : 1
pitch : 6
offset :
}
}
template: m89_mesh(w1, w2) {
layer : M8 {
direction : horizontal
width : @w1
pitch : 6
spacing : 1
offset :
}
layer : M9 {
direction : vertical
width : @w2
spacing : 1
pitch : 6
offset :
}
}
