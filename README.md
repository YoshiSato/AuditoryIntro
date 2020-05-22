# 音刺激作成プログラム ＆ 音刺激ファイル

プログラムはMATLAB R2019aにて動作確認をしています．

## プログラムの説明
- onset_offset_ramp.m
  - 純音刺激の先端と末端付近に，0に近づける処理（ramp）を行った刺激と行わない刺激を生成するプログラムです．刺激の生成・再生の例としても参考としてください．
- volume_adjust_miss.m
  - 一度ボリュームを小さくした音を保存し，後で大きくして再生するというミスを再現するプログラムです．

## サンプル音ファイルの説明
- 440Hz_with_ramp.wav（rampあり）
- 440Hz_without_ramp.wav（rampなし）

上の2つのファイルは，onset_offset_ramp.mにおいて生成された，rampありとなしの440Hzの純音刺激ファイルです．

- correct_volume.wav（小さくせずに保存）
- wrong_volume.wav（小さくして保存）

上の2つのファイルは，volume_adjust_miss.mにおいて生成された，音量を小さくする前に保存したファイルと，小さくしてから保存してしまったファイルです．

- correct_volume_played.wav
- wrong_volume_played.wav

上の2つのファイルは，上記2つのファイルを読み込んだ後で同じ音量に調整して再生した信号を保存したファイルです．wrong_volume_played.wavの方では，純音を生成したつもりが実際は異なる音色に聞こえてしまいます．

## ライセンス
- 本サイトにて公開されているファイルの著作権はYoshiyuki Sato（佐藤好幸）が保持します．
- 本サイトにて公開されているファイルには全てMITライセンスを適用します．
  - 簡単に言うと，これは著作権者の表示などをすれば使用・改変・再配布などを無制限に許可する「緩い」ライセンスです．詳しくは，MITライセンスの本文はLICENSEを，日本語訳は https://ja.osdn.net/projects/opensource/wiki/licenses%2FMIT_license をご参照ください．
