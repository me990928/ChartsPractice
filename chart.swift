import SwiftUI
import Charts

struct GrafView: View {
    
    // グラフの色
    var pointColor: Color
    
    var Cm = ChartModel()
    
    @State var tx:String = ""
    
    //  グラフデータ
    @State var charta = [charts]()
    
    var body: some View {
        VStack{
            TextField("", text: $tx).textFieldStyle(.roundedBorder)
            Button("on"){
                // キャストしてデータをアペンド
                self.Cm.add(val: Double(tx) ?? 0)
                
                // Stateのデータ更新
                charta = self.Cm.data
            }
            // グラフビュー
            Chart(charta){ point in
                BarMark(
                    x: .value("title", point.title),
                    y: .value("name", point.value)
                ).foregroundStyle(pointColor)
            }
        }
    }
}

// charts -> 構造体。雛形
struct charts: Identifiable {
    var title: String
    var value: Double
    var color: Color = .green
    var id: String {
        return title + String(value)
    }
}

// グラフのモデル
class ChartModel{
    
    var data:[charts] = []
    var d:Int = 1
    
    func add(val:Double){
        let s:String = "day\(String(d))"
        data.append(charts(title: s, value: val))
        self.d += 1
        print(data)
    }
}


struct ContentView: View {
    var body: some View {
        GrafView(pointColor: Color(.systemPink))
    }
    
}

struct GrafView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
