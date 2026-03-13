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
[eval exp="f.score += 2"]
[cm]
Vim「……悪くないじゃない」[l][r]
Vim「次は、もう少しちゃんと編集できるか見せてもらうわ」[l][jump target=*delete]

*move_clear
[eval exp="f.score += 1"]
[cm]
Vim「まあ、初心者にしては上出来ね」[l][r]
Vim「次は、もう少しちゃんと編集できるか見せてもらうわ」[l][jump target=*delete]

*move_fail
[eval exp="f.score -= 1"]
[cm]
Vim「まだ指が迷ってるわね」[l][r]
Vim「次は、もう少しちゃんと編集できるか見せてもらうわ」[l][jump target=*delete]

*delete
[cm]
Vim「Vimといえば、効率的な行編集よね。ちゃんと身についているのかしら」[l][r]
主人公「ヤンクも削除も、ひととおりは分かってるつもりだよ」[l][r]
Vim「ふうん。じゃあ、この文章に余計な一文があるのだけど……削除してもらえる？」[l][r]
[cm]

[html top=70 left=160]
<div class="editor-block">走れメロスは激怒した。<br>必ず、かの邪智暴虐の王を除かなければならぬと決意した。<br><span class="editor-cursor">メ</span>ロスは計算機室でおにぎりを二十個食べた。<br>メロスには政治がわからぬ。</div>
[endhtml]

[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:'dd',target:'*delete_dd'},{label:'x 連打',target:'*delete_x'},{label:'バックスペース連打',target:'*delete_bs'},{label:'マウスで選択してバックスペース',target:'*delete_mouse'}]})"]
[s]

*delete_dd
[eval exp="f.score += 2"]
[cm]
Vim「そう、それでいいの。行ごと消すなら素直に `dd`。分かってきたじゃない」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*insert]

*delete_x
[eval exp="f.score += 1"]
[cm]
Vim「……消えてはいるけど、ずいぶん地道なのね。嫌いじゃないけど、もっときれいにできるでしょう」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*insert]

*delete_bs
[cm]
Vim「それ、私の前でやるの？ 力任せにもほどがあるわ」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*insert]

*delete_mouse
[eval exp="f.score -= 1"]
[cm]
Vim「ちょ、ちょっと！ そこでマウスに逃げるのは反則よ……」[l][r]
Vim「……はあ。まだ分かってないみたいね」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*insert]

*insert
[cm]
Vim「コード編集には、文字の挿入も必要よね」[l][r]
主人公「カーソルの前後に入れるのも、行を追加するのも、ちゃんと覚えてるよ」[l][r]
Vim「じゃあ、このCのコード。行末のセミコロンが抜けてるわ。修正してちょうだい」[l][r]
[cm]

[html top=120 left=240]
<div class="editor-block">for (int i = 0; i &lt; n; i++) {<br>    <span class="editor-cursor">s</span>um += a&#91;i&#93;<br>}</div>
[endhtml]

[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp='window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:\"A\",target:\"*insert_A\"},{label:\"l で行末まで移動して a\",target:\"*insert_la\"},{label:\"i で入力を始める\",target:\"*insert_i\"},{label:\"行末をクリックして a\",target:\"*insert_click\"}]})']
[s]

*insert_A
[eval exp="f.score += 2"]
[cm]
Vim「そう。それがいちばん早いわ。行末に足すなら、ちゃんと `A` を使いなさい」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*judgement]

*insert_la
[eval exp="f.score += 1"]
[cm]
Vim「悪くないわ。ちゃんとVimで考えているものね。でも、もっと自然にできるでしょう？」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*judgement]

*insert_i
[cm]
Vim「……挿入は挿入だけど、その位置じゃないでしょう。惜しいわね」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*judgement]

*insert_click
[eval exp="f.score -= 1"]
[cm]
Vim「またマウスに頼るの？ そういうところ、あんまり好きじゃないわ」[l][r]
デバッグ: [emb exp="f.only_hjkl_return ? 'hjklとReturnのみ達成' : '条件未達成'"][l][jump target=*judgement]

*judgement
[cm]
Vim「あなたの実力は、見せてもらったわ」[l]

[if exp="f.score <= 1"]
  [jump target=*bad_end]
[elsif exp="f.score >= 5 && f.only_hjkl_return == true"]
  [jump target=*hidden_end]
[elsif exp="f.score >= 5"]
  [jump target=*happy_end]
[else]
  [jump target=*normal_end]
[endif]

*bad_end
[cm]
Vim「……ぜんぜんダメね。私とは、まだ合わないみたい」[l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:':q!',target:'*bad_close'}]})"]
[s]

*bad_close
[cm]
今日のことは忘れよう……。[l][r]
【 BAD END 】[l][cm]
[jump target=*start]

*normal_end
[cm]
Vim「少しは触れるようになったみたいだけど、まだまだね。……でも、見込みはあるわ。もう少し頑張りなさい」[l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:':wq',target:'*normal_close'}]})"]
[s]

*normal_close
[cm]
これからもっと、Vimちゃんのことを知っていこう。[l][r]
【 NORMAL END 】[l][cm]
[jump target=*start]

*happy_end
[cm]
Vim「しっかり使えてるのね。……えらいじゃない。よかったらこの後、vimrc読書会、しない？」[l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:':wq',target:'*happy_close'}]})"]
[s]

*happy_close
[cm]
Vimちゃんと、もっと素敵な仲になれそうな気がした。[l][r]
【 HAPPY END 】[l][cm]
[jump target=*start]

*hidden_end
[cm]
Vim「矢印キーにも逃げず、ここまで来るなんて……大したものね」[l][r]
[html top=0 left=0]
<div data-choice-root="true"></div>
[endhtml]
[eval exp="window.HappyVimmingChoiceUI && window.HappyVimmingChoiceUI.mount({choices:[{label:':wq',target:'*hidden_close'}]})"]
[s]

*hidden_close
[cm]
ゲームを終了する……はずだった。[l][r]
なのに、なぜか終了した気がしない。[l][r]
いや違う。終了したのはゲームじゃなくて、おれの「普通のエディタ人生」の方だ。[l][r]
気づけばおれは、Vimになっていた。[l][r]
【 HIDDEN END 】[l][cm]
[jump target=*start]
