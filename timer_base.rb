class TimerBase
  def initialize(minutes:) #minutesは指定できる
    @end_time = Time.now + minutes * 60  #秒単位での処理となるため60をかけている
  end

  def run     #ここにタイマーの共通の実装を書いていく
    while Time.now < @end_time  #現在の時間が現在の時間＋設定時間よりも小さい場合
      sleep 1   #sleepは指定した時間だけ次の処理にいくのを待つ
      diff_seconds = @end_time.to_i - Time.now.to_i  #残りのタイマーの時間（秒）を計算している
      remaining_minites = diff_seconds / 60  #分を表現
      remaining_seconds = format('%02d', diff_seconds - remaining_minites * 60)  #秒を表現
      print "\r#{remaining_minites}:#{remaining_seconds}"
    end
    puts
  end
end
