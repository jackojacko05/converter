#!/bin/sh

export LANG=C

header() {
  case ${FILETYPE} in
    "Ks" ) echo '騎手コード, 登録抹消フラグ, 登録抹消年月日, 騎手名, 騎手カナ, 騎手名略称, 所属コード, 所属地域名, 生年月日, 初免許年, 見習い区分, 所属厩舎, 騎手コメント, コメント入力年月日, 本年リーディング, 本年平地成績, 本年障害成績, 本年特別勝数, 本年重賞勝数, 昨年リーディング, 昨年平地成績, 昨年障害勝数, 昨年特別勝数, 昨年重賞勝数, 通算平地成績, 通算障害成績, データ年月日, 予備' ;;
    "Bac" ) echo '場コード, 年, 回, 日, R, 年月日, 発送時間, 距離, 芝ダ障害コード, 右左, 内外, 種別, 条件, 記号, 重量, グレード, レース名, 回数, 頭数, コース, 開催区分, レース名短縮, レース名9文字, データ区分, 1着賞金, 2着賞金, 3着賞金, 4着賞金, 5着賞金, 1着算入賞金, 2着算入賞金, 馬券販売フラグ, WIN5フラグ, 予備' ;;
    "Kta" ) echo '場コード, 年, 回, 日, R, 馬名キー, 血統登録番号, 馬名, 性別コード, 馬記号コード, ブリンカー, 騎手名, 負担重量, 見習い区分, 調教師名, 調教師所属, IDM, 上昇度, ローテーション, 脚質, 距離適正, 距離適正2, 芝適正コード, ダ適正コード, 重適正コード, 蹄コード, クラスコード, 毛色コード, 前走1競争成績キー, 前走2競争成績キー, 前走3競争成績キー, 前走4競争成績キー, 前走5競争成績キー, 前走1レースキー, 前走2レースキー, 前走3レースキー, 前走4レースキー, 前走5レースキー, 騎手コード, 調教師コード, 獲得賞金, 収得賞金, 条件クラス, 走法, 体型, 体型総合1, 体型総合2, 体型総合3, 馬特記1, 馬特記2, 馬特記3, テン指数, ペース指数, 上がり指数, 位置指数, 馬スタート指数, 馬出遅率, 参考前走, 参考前走騎手コード, データ区分, 出走順位, 予備' ;;
    "Kyi" ) echo '場コード, 年, 回, 日, R, 馬番, 血統登録番号, 馬名, IDM, 騎手指数, 情報指数, 予備1, 予備2, 予備3, 総合指数, 脚質, 距離適正, 上昇度, ローテーション, 基準オッズ, 基準人気順位, 基準複勝オッズ, 基準複勝人気順位, 特定情報◎, 特定情報○, 特定情報▲, 特定情報△, 特定情報×, 総合情報◎, 総合情報○, 総合情報▲, 総合情報△, 総合情報×, 人気指数, 調教指数, 厩舎指数, 調教矢印コード, 厩舎評価コード, 騎手期待連対率, 激走指数, 蹄コード, 重適正コード, クラスコード, 予備, ブリンカー, 騎手名, 負担重量, 見習い区分, 調教師名, 調教師所属, 前走1競争成績キー, 前走2競争成績キー, 前走3競争成績キー, 前走4競争成績キー, 前走5競争成績キー, 前走1レースキー, 前走2レースキー, 前走3レースキー, 前走4レースキー, 前走5レースキー, 枠番, 予備, 総合印, IDM印, 情報印, 騎手印, 厩舎印, 調教印, 激走印, 芝適正コード, ダ適正コード, 騎手コード, 調教師コード, 予備, 獲得賞金, 収得賞金, 条件クラス, テン指数, ペース指数, 上がり指数, 位置指数, ペース予想, 道中順位, 道中差, 道中内外, 後3F順位, 後3F差, 後3F内外, ゴール順位, ゴール差, ゴール内外, 展開記号, 距離適正2, 枠確定馬体重, 枠確定馬体重増減, 取消フラグ, 性別コード, 馬主名, 馬主会コード, 馬記号コード, 激走順位, LS指数順位, テン指数順位, ペース指数順位, 上がり指数順位, 位置指数順位, 騎手期待単勝率, 騎手期待3着内率, 輸送区分, 走法, 体型, 体型総合1, 体型総合2, 体型総合3, 馬特記1, 馬特記2, 馬特記3, 馬スタート指数, 馬出遅率, 参考前走, 参考前走騎手コード, 万券指数, 万券印, 降級フラグ, 激走タイプ, 休養理由分類コード, フラグ, 入厩何走目, 入厩年月日, 入厩何日前, 放牧先, 放牧先ランク, 厩舎ランク, 予備' ;;
    "Ukc" ) echo '血統登録番号, 馬名, 性別コード, 毛色コード, 馬記号コード, 父馬名, 母馬名, 母父馬名, 生年月日, 父馬生年, 母馬生年, 母父馬生年, 馬主名, 馬主会コード, 生産者名, 産地名, 登録抹消フラグ, データ年月日, 父系統コード, 母父系統コード, 予備' ;;
  esac
}

field_bytes() {
  case ${FILETYPE} in
    "Ks" ) echo "5 1 8 12 30 6 1 4 8 4 1 5 40 8 3 12 12 3 3 3 12 12 3 3 20 20 8 23" ;;
    "Bac" ) echo "2 2 1 1 2 8 4 4 1 1 1 2 2 3 1 1 50 8 2 1 1 8 18 1 5 5 5 5 5 5 5 16 1 5" ;;
    "Kta" ) echo "2 2 1 1 2 40 8 36 1 2 1 12 3 1 12 4 5 1 3 1 1 1 1 1 1 2 2 2 16 16 16 16 16 8 8 8 8 8 5 5 6 5 1 8 24 3 3 3 3 3 3 5 5 5 5 4 4 2 5 1 3 6" ;;
    "Kyi" ) echo "2 2 1 1 2 2 8 36 5 5 5 5 5 5 5 1 1 1 3 5 2 5 2 3 3 3 3 3 3 3 3 3 3 5 5 5 1 1 4 3 2 1 2 2 1 12 3 1 12 4 16 16 16 16 16 8 8 8 8 8 1 2 1 1 1 1 1 1 1 1 1 5 5 1 6 5 1 5 5 5 5 1 2 2 1 2 2 1 2 2 1 1 1 3 3 1 1 40 2 2 2 2 2 2 2 2 4 4 1 8 24 3 3 3 3 3 3 4 4 2 5 3 1 1 2 2 16 2 8 3 50 1 1 398" ;;
    "Ukc" ) echo "8 36 1 2 2 36 36 36 8 4 4 4 40 2 40 8 1 8 4 4 6" ;;
  esac
}

filename_prefix() {
  if [ ${FILETYPE} = 'Ks' ]; then
    echo 'kza'
  else
    echo $(tr '[A-Z]' '[a-z]' <<< $FILETYPE)
  fi
}

convert() {
  header=$(header)
  echo $header > ${OUTPUT_DIRECTORY}${FILETYPE}/$(filename_prefix)${FILEDATE}.csv

  gawk -v field_bytes="$(field_bytes)" '
    BEGIN{
      FIELDWIDTHS=field_bytes;
      OFS=","
    }
    {
      c="";
      for(i=1; i<=NF; i++) c=c $i",";
      print c;
    }
  ' ${INPUT_DIRECTORY}${FILETYPE}/$(filename_prefix)${FILEDATE}.txt | \
  iconv -f CP932 -t utf8 >> ${OUTPUT_DIRECTORY}${FILETYPE}/$(filename_prefix)${FILEDATE}.csv
}

pre_process() {
  mkdir -p ${OUTPUT_DIRECTORY}${FILETYPE}
}

main() {
  if [ -f ${INPUT_DIRECTORY}${FILETYPE}/$(filename_prefix)${FILEDATE}.txt ]; then
    pre_process
    convert
    echo ${OUTPUT_DIRECTORY}${FILETYPE}/$(filename_prefix)${FILEDATE}.csv is created.
  else
    echo ${INPUT_DIRECTORY}${FILETYPE}/$(filename_prefix)${FILEDATE}.txt is does not exist.
  fi
}

cat <<EOS

Filetype? (ex. Ks)

以下のファイルタイプが選択できます。
===================================
JRDB 騎手データ  : Ks
JRDB 番組データ  : Bac
JRDB 登録馬データ: Kta
JRDB 馬基本データ: Ukc
JRDB 競争馬データ: Kyi
===================================
EOS

read FILETYPE

cat <<EOS

Filedate? (ex. 220319)
yymmdd の形式で入力してください。
EOS

read FILEDATE

main
