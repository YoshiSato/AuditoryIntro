%%%%% ��x�{�����[������������������ۑ����C��ő傫�����čĐ�����Ƃ����~�X���Č�����

f = 440; % �h�����̎��g���iHz�j
dur = 1; % ���̎������ԁi�b�j
vol = 0.1; % �ŏI�I�ɍĐ�����{�����[��
vol2 = 0.001; % �ԈႦ�Ĉ�x���������Ă��܂��{�����[��
sf = 44100; % �T���v�����O���g���iHz�j

win_dur = 0.01; % ���̖��[�������s�����ԕ��i�b�j

%%% �����g�`����

t = 0:1/sf:dur;
y = sin(2*pi*f*t + 1);

% ���[�����̂��߂̃R�T�C���^��̐���
win_t = 0:1/sf:win_dur;
win_f = 1/(2*win_dur);
win_sin = (cos(2*pi*win_f*win_t) + 1) / 2;
win = [win_sin(end:-1:1) ones(1, length(y) - 2 * length(win_sin)) win_sin];

% �����ςݔg�`����
y2 = win .* y;

%%%%% ��x�g�`��ۑ����Ă���ǂݍ��ރf��

%%% ���������@�F�{�����[����������O�̎h����ۑ����C�Đ����Ƀ{�����[����������D
%%% ���������correct_volume.wav���_�u���N���b�N�ōĐ�����Ɖ��ʂ͑傫���t�@�C���ɂȂ��Ă���D

% �h���̕ۑ��D���̐M�������̂܂ܕۑ�
audiowrite('correct_volume.wav', y2, sf);

% ����ǂݍ��݁C�Đ����ɉ��ʂ𒲐��D
y_read = audioread('correct_volume.wav');
player = audioplayer(y_read * vol, sf);
player.play;
pause(2);

% �f���p�ɍĐ������M�����ۑ�
audiowrite('correct_volume_played.wav', y_read * vol, sf);

%%% �Ԉ�������@�F�{�����[�����������h����ۑ����C���Ƃŏグ�čĐ�����D
%%% ���������wrong_volume.wav���_�u���N���b�N�ōĐ�����Ɖ��ʂ͏������������ɕ�������D
%%% �����������ǂݍ���ł��疳���ɑ傫�����čĐ�����Ə����Ƃ͈قȂ鉹�F�ɂȂ�D

% �h���̕ۑ��D���ʂ�������������̐M����ۑ����Ă��邱�Ƃɒ��ځD
audiowrite('wrong_volume.wav', y2 * vol2, sf);

% ���̍Đ����ɉ��ʂ��グ�čĐ��D
y_read = audioread('wrong_volume.wav');
player = audioplayer(y_read / vol2 * vol, sf);
player.play;

% �f���p�ɍĐ������M�����ۑ�
audiowrite('wrong_volume_played.wav', y_read / vol2 * vol, sf);



