*start

[title name="Happy Vimming"]
[hidemenubutton]
[wait time=200]
[cm]
[freeimage layer="base"]
[eval exp="f.score = 0"]
[eval exp="f.only_hjkl_return = true"]

Returnキーで進みます。[l][r]
「Happy Vimming」[l][r]

計算物理春の学校2026から帰ったおれは、いつものように計算機室に来ていた。[l][r]
計算機室には、いつものようにVimちゃんがいる。[l][r]
無駄のない、すこし近寄りがたい気品には前から惹かれていた。[l][r]
けれど、春学でVimに少し慣れた今なら、前よりちゃんと親しめる気がする。[l][r]
勇気を出して声をかける。[l][r]

Vim「春の学校で、少しは慣れたようね。……なら、見せてみなさいよ」[l][cm]

「カーソル移動、まさか矢印キーなんて言わないわよね？」[l][r]
主人公「もちろん `hjkl` さ。ホームポジションから手を離すなんて考えられないよ」[l][r]
Vim「……ふうん。口ではなんとでも言えるものね。本当に身についているか、見せてごらんなさい」[l][r]
Vim「ミニゲームはあとで実装するけれど、今は結果だけ見せてもらうわ」[l][cm]

ミニゲーム仮結果を選んでください。[l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:'高成績',target:'*move_high'},{label:'クリア',target:'*move_clear'},{label:'失敗',target:'*move_fail'}]})"]
[s]

*move_high
[eval exp="f.score = 2"]
[cm]
Vim「……悪くないじゃない」[l][r]
スコア: [emb exp="f.score"][l][r]
隠し条件デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:'最初に戻る',target:'*start'}]})"]
[s]

*move_clear
[eval exp="f.score = 1"]
[cm]
Vim「まあ、初心者にしては上出来ね」[l][r]
スコア: [emb exp="f.score"][l][r]
隠し条件デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:'最初に戻る',target:'*start'}]})"]
[s]

*move_fail
[eval exp="f.score = -1"]
[cm]
Vim「まだ指が迷ってるわね」[l][r]
スコア: [emb exp="f.score"][l][r]
隠し条件デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:'最初に戻る',target:'*start'}]})"]
[s]
