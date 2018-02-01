//
//  FlightInterfaceController.swift
//  AirAber
//
//  Created by Zubair on 12/2/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import WatchKit

class FlightInterfaceController: WKInterfaceController {
  
  @IBOutlet var flightLabel: WKInterfaceLabel!
  @IBOutlet var routeLabel: WKInterfaceLabel!
  @IBOutlet var boardingLabel: WKInterfaceLabel!
  @IBOutlet var boardTimeLabel: WKInterfaceLabel!
  @IBOutlet var statusLabel: WKInterfaceLabel!
  @IBOutlet var gateLabel: WKInterfaceLabel!
  @IBOutlet var seatLabel: WKInterfaceLabel!
  // 1
  var flight: Flight? {
    // 2
    didSet {
      // 3
      guard let flight = flight else { return }
      // 4
      flightLabel.setText("Flight \(flight.shortNumber)")
      routeLabel.setText(flight.route)
      boardingLabel.setText("\(flight.number) Boards")
      boardTimeLabel.setText(flight.boardsAt)
      // 5
      if flight.onSchedule {
        statusLabel.setText("On Time")
      } else {
        statusLabel.setText("Delayed")
        statusLabel.setTextColor(.red)
      }
      gateLabel.setText("Gate \(flight.gate)")
      seatLabel.setText("Seat \(flight.seat)")
    }
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    flight = Flight.allFlights().first
  }
}
