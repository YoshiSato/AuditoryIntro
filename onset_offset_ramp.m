%%%%% �����̐�[�Ɩ��[�t�߂ɁC0�ɋ߂Â��鏈�����s�����h���ƍs��Ȃ��h�����r����

f = 440; % �h�����̎��g���iHz�j
dur = 1; % ���̎������ԁi�b�j
vol = 0.5; % �Đ����̃{�����[��
sf = 44100; % �T���v�����O���g���iHz�j

win_dur = 0.01; % ���̖��[�������s�����ԕ��i�b�j


%%% �����g�`�̐���
t = 0:1/sf:dur;
y = sin(2*pi*f*t + 1);

%%% ���[�������s�����g�`�̐���
% ���[�����̂��߂̃R�T�C���^��̐���
% 2*pi*f*win_dur = pi -> f = 1/(2*win_dur)
win_t = 0:1/sf:win_dur;
win_f = 1/(2*win_dur);
win_sin = (cos(2*pi*win_f*win_t) + 1) / 2;
win = [win_sin(end:-1:1) ones(1, length(y) - 2 * length(win_sin)) win_sin];

% �g�`����
y2 = win .* y;

% ���̍Đ�
player = audioplayer(y * vol, sf);
play(player);

pause(2); % �Đ��J�n����2�b�ҋ@

player2 = audioplayer(y2 * vol, sf);
play(player2);

%% octave�̏ꍇ�́C�ȉ��̂悤�ɐM���̌�Ƀ[�������Ȃ��ƃv�c�b�ƕ������邩������܂���
% player2 = audioplayer([y2 zeros(1, 1*sf)] * vol, sf);
% play(player2);



%%% �i�{�����[�������O�́j���h���̕ۑ�

audiowrite('440Hz_without_ramp.wav', y, sf);
audiowrite('440Hz_with_ramp.wav', y2, sf);


%%% �g�`�̐}��`������

figure;

subplot(1, 2, 1);
plot(t, y, 'b');
xlim([0.985 inf]);
ylim([-1.1 1.1]);
title('���������̖��[�t��')

subplot(1, 2, 2);
plot(t, y2, 'b');
hold all;
plot(t, win, 'r');
xlim([0.985 inf]);
ylim([-1.1 1.1]);
title('�����ς݉��̖��[�t�߁i�j�ƁC�������킹������i�ԁj')

