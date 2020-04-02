require "bowling"

describe "ボウリングのスコア計算" do
    
    before do
        @game = Bowling.new
    end
    
    describe "全体の合計" do
        context "すべての投球がガターだった場合" do
           it "0になること" do
              add_many_scores(20,0)
              expect(@game.total_score).to eq 0
           end
        end
        
        context "全ての投球で１ピンずつ倒した場合" do
           it "20になること" do
              add_many_scores(20,1)
              @game.calc_score
              expect(@game.total_score).to eq 20
           end
        end
        
        context "スペアをとった場合" do
           it "スペアボーナスが加算されること" do
              #第１フレーム
              @game.add_score(3)
              @game.add_score(7)
              #第２フレーム
              @game.add_score(4)
              #それ以降
              add_many_scores(17,0)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 18
           end
        end
        
        context "フレーム違いでスペアになるようなスコアだった場合"do 
           it "スペアボーナスが加算されないこと" do
               #第１フレーム
              @game.add_score(3)
              @game.add_score(5)
              #第２フレーム
              @game.add_score(5)
              @game.add_score(4)
              #それ以降
              add_many_scores(16,0)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 17
           end
        end
        
        context "最終フレームでスペアをとった場合" do
           it "スペアボーナスが加算されないこと"do
                #第１フレーム
              @game.add_score(3)
              @game.add_score(7)
              #第２フレーム
              @game.add_score(4)
              #それ以降
              add_many_scores(15,0)
              #最終フレームでスペア
              @game.add_score(3)
              @game.add_score(7)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 28
           end
        end
        
        context "ストライクを取った場合" do
           it "ストライクボーナスが加算されること" do
              #第１フレーム
              @game.add_score(10)
              #第２フレーム
              @game.add_score(5)
              @game.add_score(4)
              #以降はすべてガター
              add_many_scores(16,0)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 28
           end
        end
        
        context "ダブルを取った場合" do
           it "それぞれのストライクボーナスが加算されること" do
              #第１フレーム
              @game.add_score(10)
              #第２フレーム
              @game.add_score(10)
              #第３フレーム
              @game.add_score(5)
              @game.add_score(4)
              #以降はすべてガター
              add_many_scores(14,0)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 53
           end
        end
        
        context "ターキーを取った場合" do
           it "それぞれのストライクボーナスが加算されること" do
              #第１フレーム
              @game.add_score(10)
              #第２フレーム
              @game.add_score(10)
              #第３フレーム
              @game.add_score(5)
              @game.add_score(4)
              #以降はすべてガター
              add_many_scores(12,0)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 83
           end
        end
        
        context "最終フレームでストライクを取った場合" do
           it "ストライクボーナスが加算されないこと" do
              #第１フレーム
              @game.add_score(10)
              #第２フレーム
              @game.add_score(5)
              @game.add_score(4)
              #3~9はすべてガター
              add_many_scores(14,0)
              #最終フレームでストライク
              @game.add_score(10)
              #合計を計算
              @game.calc_score
              #期待する値
              expect(@game.total score).to eq 38
           end
        end
        
    end
end

def add_many_scores(count,pins)
        count.times do
            @game.add_score(pins)
        end
end

describe "フレームごとの合計" do
   context "全ての投球で1品ずつ倒した場合" do
      it "1フレーム目の合計が２になること" do
         add_many_scores(20,1)
         #合計を計算
         @game.calc_score
         expect(@game.frame_score(1)).to eq 2
      end
   end
   
   context "スペアをとった場合" do
       it "スペアボーナスが加算されること" do
          #第１フレーム
          @game.add_score(3)
          @game.add_score(7)
          #第２フレーム
          @game.add_score(4)
          #それ以降
          add_many_scores(17,0)
          #合計を計算
          @game.calc_score
          #期待する値
          expect(@game.total score).to eq 14
       end
    end
    
    context "ストライクを取った場合" do
       it "ストライクボーナスが加算されること" do
          #第１フレーム
          @game.add_score(10)
          #第２フレーム
          @game.add_score(5)
          @game.add_score(4)
          #以降はすべてガター
          add_many_scores(16,0)
          #合計を計算
          @game.calc_score
          #期待する値
          expect(@game.total score).to eq 19
       end
    end
    
end


