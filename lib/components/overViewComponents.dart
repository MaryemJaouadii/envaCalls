import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:try_salestrail/constants.dart';


//Overview Analytics
class ContainerBuild extends StatelessWidget {
  ContainerBuild({ this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(

        child: cardChild,
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),


        ),
      ),
    );
  }
}


//Most active hour by calls
class HoursCallChart extends StatelessWidget {
  HoursCallChart({ this.chartData});
  List<ChartData> chartData;
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(

        legend: Legend(isVisible:true,overflowMode: LegendItemOverflowMode.wrap),
        series: <CircularSeries<ChartData, String>>[

          PieSeries<ChartData, String>(
            // Bind data source
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.legend,
              yValueMapper: (ChartData sales, _) => sales.data,
              dataLabelSettings: DataLabelSettings(isVisible:true)
          )
        ]
    );
  }
}


//Top performers by outbound calls
class Performer extends StatelessWidget {
  Performer({ this.rank, this.userName,this.callsNumber});
  final Widget rank;
  final String userName;
  final String callsNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex:3,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: rank
            ),
          ),Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(userName,style: kTextStyle2,),
              )),
          Expanded(
            flex: 3,
            child: Text(callsNumber,style: kTextStyle2 ),),

        ],
      ),
    );
  }
}


//Connection Rate Overtime
class ConnectionRateChart extends StatelessWidget {
  ConnectionRateChart({ this.chartDataForAnswered, this.chartDataForUnAnswered});
  List<ChartData> chartDataForAnswered;
  List<ChartData> chartDataForUnAnswered;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(

        palette: <Color>[Color(0xFFED4E82), Color(0xFF2DBDD8)],
        // Initialize category axis
        primaryXAxis: CategoryAxis(
          //Hide the gridlines of y-axis
          majorGridLines: MajorGridLines(width: 0),
          //Hide the axis line of y-axis
          axisLine: AxisLine(width: 0),
        ),
        legend: Legend(isVisible:true,overflowMode:LegendItemOverflowMode.wrap),

        series: <ColumnSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            // Bind data source
            name: 'Answered',
            dataSource: chartDataForAnswered,
            xValueMapper: (ChartData sales, _) => sales.legend,
            yValueMapper: (ChartData sales, _) => sales.data,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(3)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: kGradientPink),

          ),
          ColumnSeries<ChartData, String>(
            // Bind data source
              name: 'Unanswered',
              dataSource: chartDataForUnAnswered,
              xValueMapper: (ChartData sales, _) => sales.legend,
              yValueMapper: (ChartData sales, _) => sales.data,
              borderRadius: BorderRadius.only(topRight: Radius.circular(3)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: kGradientBlue)
          )
        ]
    );
  }
}



//class to manage charts data
class ChartData {
  ChartData(this.legend, this.data);
  final String legend;
  final double data;
}




//Dialog