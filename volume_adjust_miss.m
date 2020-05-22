%%%%% 一度ボリュームを小さくした音を保存し，後で大きくして再生するというミスを再現する

f = 440; % 刺激音の周波数（Hz）
dur = 1; % 音の持続時間（秒）
vol = 0.1; % 最終的に再生するボリューム
vol2 = 0.001; % 間違えて一度小さくしてしまうボリューム
sf = 44100; % サンプリング周波数（Hz）

win_dur = 0.01; % 音の末端処理を行う時間幅（秒）

%%% 純音波形生成

t = 0:1/sf:dur;
y = sin(2*pi*f*t + 1);

% 末端処理のためのコサイン型包絡の生成
win_t = 0:1/sf:win_dur;
win_f = 1/(2*win_dur);
win_sin = (cos(2*pi*win_f*win_t) + 1) / 2;
win = [win_sin(end:-1:1) ones(1, length(y) - 2 * length(win_sin)) win_sin];

% 処理済み波形生成
y2 = win .* y;

%%%%% 一度波形を保存してから読み込むデモ

%%% 正しい方法：ボリュームを下げる前の刺激を保存し，再生時にボリュームを下げる．
%%% 生成されるcorrect_volume.wavをダブルクリックで再生すると音量は大きいファイルになっている．

% 刺激の保存．元の信号をそのまま保存
audiowrite('correct_volume.wav', y2, sf);

% 音を読み込み，再生時に音量を調整．
y_read = audioread('correct_volume.wav');
player = audioplayer(y_read * vol, sf);
player.play;
pause(2);

% デモ用に再生した信号も保存
audiowrite('correct_volume_played.wav', y_read * vol, sf);

%%% 間違った方法：ボリュームを下げた刺激を保存し，あとで上げて再生する．
%%% 生成されるwrong_volume.wavをダブルクリックで再生すると音量は小さいが純音に聞こえる．
%%% しかしそれを読み込んでから無理に大きくして再生すると純音とは異なる音色になる．

% 刺激の保存．音量を小さくした後の信号を保存していることに注目．
audiowrite('wrong_volume.wav', y2 * vol2, sf);

% 音の再生時に音量を上げて再生．
y_read = audioread('wrong_volume.wav');
player = audioplayer(y_read / vol2 * vol, sf);
player.play;

% デモ用に再生した信号も保存
audiowrite('wrong_volume_played.wav', y_read / vol2 * vol, sf);



