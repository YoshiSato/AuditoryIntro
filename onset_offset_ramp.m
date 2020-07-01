%%%%% 純音の先端と末端付近に，0に近づける処理を行った刺激と行わない刺激を比較する

f = 440; % 刺激音の周波数（Hz）
dur = 1; % 音の持続時間（秒）
vol = 0.5; % 再生時のボリューム
sf = 44100; % サンプリング周波数（Hz）

win_dur = 0.01; % 音の末端処理を行う時間幅（秒）


%%% 純音波形の生成
t = 0:1/sf:dur;
y = sin(2*pi*f*t + 1);

%%% 末端処理を行った波形の生成
% 末端処理のためのコサイン型包絡の生成
% 2*pi*f*win_dur = pi -> f = 1/(2*win_dur)
win_t = 0:1/sf:win_dur;
win_f = 1/(2*win_dur);
win_sin = (cos(2*pi*win_f*win_t) + 1) / 2;
win = [win_sin(end:-1:1) ones(1, length(y) - 2 * length(win_sin)) win_sin];

% 波形生成
y2 = win .* y;

% 音の再生
player = audioplayer(y * vol, sf);
play(player);

pause(2); % 再生開始から2秒待機

player2 = audioplayer(y2 * vol, sf);
play(player2);

%% octaveの場合は，以下のように信号の後にゼロを入れないとプツッと聞こえるかもしれません
% player2 = audioplayer([y2 zeros(1, 1*sf)] * vol, sf);
% play(player2);



%%% （ボリューム調整前の）音刺激の保存

audiowrite('440Hz_without_ramp.wav', y, sf);
audiowrite('440Hz_with_ramp.wav', y2, sf);


%%% 波形の図を描き可視化

figure;

subplot(1, 2, 1);
plot(t, y, 'b');
xlim([0.985 inf]);
ylim([-1.1 1.1]);
title('未処理音の末端付近')

subplot(1, 2, 2);
plot(t, y2, 'b');
hold all;
plot(t, win, 'r');
xlim([0.985 inf]);
ylim([-1.1 1.1]);
title('処理済み音の末端付近（青）と，かけ合わせた包絡線（赤）')

