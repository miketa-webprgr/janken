module JankenMapper
  GCP =
    { g: 'グー', c: 'チョキ', p: 'パー' }.freeze
  GCP_RESULT =
    { easy: {
      g: { g: 'あいこ', c: '勝ち', p: '負け' },
      c: { g: '負け', c: 'あいこ', p: '勝ち' },
      p: { g: '勝ち', c: '負け', p: 'あいこ' }
    },
      hard: {
        g: { g: '負け', c: '勝ち', p: '負け' },
        c: { g: '負け', c: '負け', p: '勝ち' },
        p: { g: '勝ち', c: '負け', p: '負け' }
      } }.freeze
end
