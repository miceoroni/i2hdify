ffmpeg -y -i udp:127.0.0.1:1337 -filter_complex "
[0:v]eq=brightness=0.10:saturation=1.21[v];
sine=frequency=1030:duration=0.125[s1];
sine=frequency=1230:duration=0.125[s2];
sine=frequency=1410:duration=0.125[s3];
sine=frequency=1610:duration=0.125[s4];
sine=frequency=1800:duration=0.125[s5];
sine=frequency=1980:duration=0.125[s6];
sine=frequency=2180:duration=0.125[s7];
sine=frequency=2410:duration=0.125[s8];
sine=frequency=2620:duration=0.125[s9];
sine=frequency=2800:duration=0.125[s10];
[s1][s2][s3][s4][s5][s6][s7][s8][s9][s10]amix=inputs=10[audio_tones];
[0:a][audio_tones]amix=inputs=2:weights=1 0.02:duration=first[a]
" -map "[v]" -map "[a]" -c:v mpeg2video -b:v 16M -c:a aac udp:127.0.0.1:4583
