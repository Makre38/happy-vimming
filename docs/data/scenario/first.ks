*start

[title name="Happy Vimming"]
[hidemenubutton]
[wait time=200]
[cm]
[freeimage layer="base"]
[eval exp="f.score = 0"]
[eval exp="f.used_arrow = false"]

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
[link target=*move_high] →高成績 [endlink][r]
[link target=*move_clear] →クリア [endlink][r]
[link target=*move_fail] →失敗 [endlink][r]
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

走れメロスは激怒した。[r]
必ず、かの邪智暴虐の王を除かなければならぬと決意した。[r]
メロスは計算機室でおにぎりを二十個食べた。[r]
メロスには政治がわからぬ。[l][cm]

[link target=*delete_dd] `dd` [endlink][r]
[link target=*delete_x] `x` 連打 [endlink][r]
[link target=*delete_bs] バックスペース連打 [endlink][r]
[link target=*delete_mouse] マウスで選択してバックスペース [endlink][r]
[s]

*delete_dd
[eval exp="f.score += 2"]
[cm]
Vim「そう、それでいいの。行ごと消すなら素直に `dd`。分かってきたじゃない」[l][jump target=*insert]

*delete_x
[eval exp="f.score += 1"]
[cm]
Vim「……消えてはいるけど、ずいぶん地道なのね。嫌いじゃないけど、もっときれいにできるでしょう」[l][jump target=*insert]

*delete_bs
[cm]
Vim「それ、私の前でやるの？ 力任せにもほどがあるわ」[l][jump target=*insert]

*delete_mouse
[eval exp="f.score -= 1"]
[eval exp="f.used_arrow = true"]
[cm]
Vim「ちょ、ちょっと！ そこでマウスに逃げるのは反則よ……」[l][r]
Vim「……はあ。まだ分かってないみたいね」[l][jump target=*insert]

*insert
[cm]
Vim「コード編集には、文字の挿入も必要よね」[l][r]

主人公「カーソルの前後に入れるのも、行を追加するのも、ちゃんと覚えてるよ」[l][r]

Vim「じゃあ、このCのコード。行末のセミコロンが抜けてるわ。修正してちょうだい」[l][r]
[cm]

for (int i = 0; i < n; i++) {[r]
    sum += a[i][r]
}[l][cm]

[link target=*insert_A] `A` [endlink][r]
[link target=*insert_la] `l` で行末まで移動して `a` [endlink][r]
[link target=*insert_i] `i` で入力を始める [endlink][r]
[link target=*insert_click] 行末をクリックして `a` [endlink][r]
[s]

*insert_A
[eval exp="f.score += 2"]
[cm]
Vim「そう。それがいちばん早いわ。行末に足すなら、ちゃんと `A` を使いなさい」[l][jump target=*judgement]

*insert_la
[eval exp="f.score += 1"]
[cm]
Vim「悪くないわ。ちゃんとVimで考えているものね。でも、もっと自然にできるでしょう？」[l][jump target=*judgement]

*insert_i
[cm]
Vim「……挿入は挿入だけど、その位置じゃないでしょう。惜しいわね」[l][jump target=*judgement]

*insert_click
[eval exp="f.score -= 1"]
[eval exp="f.used_arrow = true"]
[cm]
Vim「またマウスに頼るの？ そういうところ、あんまり好きじゃないわ」[l][jump target=*judgement]

*judgement
[cm]
Vim「あなたの実力は、見せてもらったわ」[l]

[if exp="f.score <= 1"]
  [jump target=*bad_end]
[elsif exp="f.score >= 5 && f.used_arrow == false"]
  [jump target=*hidden_end]
[elsif exp="f.score >= 5"]
  [jump target=*happy_end]
[else]
  [jump target=*normal_end]
[endif]

*bad_end
[cm]
Vim「……ぜんぜんダメね。私とは、まだ合わないみたい」[l][r]
[link target=*bad_close] `:q!` [endlink][s]

*bad_close
[cm]
今日のことは忘れよう……。[l][r]
【 BAD END 】[l][cm]
[jump target=*start]

*normal_end
[cm]
Vim「少しは触れるようになったみたいだけど、まだまだね。……でも、見込みはあるわ。もう少し頑張りなさい」[l][r]
[link target=*normal_close] `:wq` [endlink][s]

*normal_close
[cm]
これからもっと、Vimちゃんのことを知っていこう。[l][r]
【 NORMAL END 】[l][cm]
[jump target=*start]

*happy_end
[cm]
Vim「しっかり使えてるのね。……えらいじゃない。よかったらこの後、vimrc読書会、しない？」[l][r]
[link target=*happy_close] `:wq` [endlink][s]

*happy_close
[cm]
Vimちゃんと、もっと素敵な仲になれそうな気がした。[l][r]
【 HAPPY END 】[l][cm]
[jump target=*start]

*hidden_end
[cm]
Vim「矢印キーにも逃げず、ここまで来るなんて……大したものね」[l][r]
[link target=*hidden_close] `:wq` [endlink][s]

*hidden_close
[cm]
ゲームを終了する……はずだった。[l][r]
なのに、なぜか終了した気がしない。[l][r]
いや違う。終了したのはゲームじゃなくて、おれの「普通のエディタ人生」の方だ。[l][r]
気づけばおれは、Vimになっていた。[l][r]
【 HIDDEN END 】[l][cm]
[jump target=*start]
