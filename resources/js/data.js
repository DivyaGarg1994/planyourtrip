var respq = {
 "kind": "qpxExpress#tripsSearch",
 "trips": {
  "kind": "qpxexpress#tripOptions",
  "requestId": "JnJNnMCBKCXwIImj90P5GC",
  "data": {
   "kind": "qpxexpress#data",
   "airport": [
    {
     "kind": "qpxexpress#airportData",
     "code": "BOM",
     "city": "BOM",
     "name": "Mumbai/Bombay Chhatrapati Shivaji Int'l"
    },
    {
     "kind": "qpxexpress#airportData",
     "code": "DEL",
     "city": "DEL",
     "name": "Delhi Indira Gandhi International"
    },
    {
     "kind": "qpxexpress#airportData",
     "code": "GOI",
     "city": "GOI",
     "name": "Goa Dabolim"
    }
   ],
   "city": [
    {
     "kind": "qpxexpress#cityData",
     "code": "BOM",
     "name": "Mumbai"
    },
    {
     "kind": "qpxexpress#cityData",
     "code": "DEL",
     "name": "Delhi"
    },
    {
     "kind": "qpxexpress#cityData",
     "code": "GOI",
     "name": "Goa"
    }
   ],
   "aircraft": [
    {
     "kind": "qpxexpress#aircraftData",
     "code": "738",
     "name": "Boeing 737"
    },
    {
     "kind": "qpxexpress#aircraftData",
     "code": "739",
     "name": "Boeing 737"
    },
    {
     "kind": "qpxexpress#aircraftData",
     "code": "73H",
     "name": "Boeing 737"
    }
   ],
   "tax": [
    {
     "kind": "qpxexpress#taxData",
     "id": "WO_001",
     "name": "Indian Passenger Service Fee"
    },
    {
     "kind": "qpxexpress#taxData",
     "id": "F2_001",
     "name": "Indian Swachh Bharat Cess Service Tax"
    },
    {
     "kind": "qpxexpress#taxData",
     "id": "JN_004",
     "name": "Indian Service Tax"
    },
    {
     "kind": "qpxexpress#taxData",
     "id": "YQ_F",
     "name": "9W YQ surcharge"
    },
    {
     "kind": "qpxexpress#taxData",
     "id": "YR_F",
     "name": "9W YR surcharge"
    },
    {
     "kind": "qpxexpress#taxData",
     "id": "G1_001",
     "name": "India Krishi Kalyan Cess"
    },
    {
     "kind": "qpxexpress#taxData",
     "id": "IN_001",
     "name": "Indian User Development Fee"
    }
   ],
   "carrier": [
    {
     "kind": "qpxexpress#carrierData",
     "code": "9W",
     "name": "Jet Airways (India) Limited"
    }
   ]
  },
  "tripOption": [
   {
    "kind": "qpxexpress#tripOption",
    "saleTotal": "INR7150",
    "id": "aMAwBkJhzg6MkshLiUYI1I001",
    "slice": [
     {
      "kind": "qpxexpress#sliceInfo",
      "duration": 230,
      "segment": [
       {
        "kind": "qpxexpress#segmentInfo",
        "duration": 125,
        "flight": {
         "carrier": "9W",
         "number": "352"
        },
        "id": "GQsVPyTH7JS0w8W3",
        "cabin": "COACH",
        "bookingCode": "O",
        "bookingCodeCount": 7,
        "marriedSegmentGroup": "0",
        "leg": [
         {
          "kind": "qpxexpress#legInfo",
          "id": "LCI-iNow5dPBk9GA",
          "aircraft": "739",
          "arrivalTime": "2016-09-30T16:05+05:30",
          "departureTime": "2016-09-30T14:00+05:30",
          "origin": "DEL",
          "destination": "BOM",
          "originTerminal": "3",
          "destinationTerminal": "2",
          "duration": 125,
          "mileage": 706,
          "meal": "Lunch"
         }
        ],
        "connectionDuration": 35
       },
       {
        "kind": "qpxexpress#segmentInfo",
        "duration": 70,
        "flight": {
         "carrier": "9W",
         "number": "426"
        },
        "id": "GiFXczU-NuCGjTvt",
        "cabin": "COACH",
        "bookingCode": "S",
        "bookingCodeCount": 7,
        "marriedSegmentGroup": "1",
        "leg": [
         {
          "kind": "qpxexpress#legInfo",
          "id": "LdcJqztZy471ewoN",
          "aircraft": "738",
          "arrivalTime": "2016-09-30T17:50+05:30",
          "departureTime": "2016-09-30T16:40+05:30",
          "origin": "BOM",
          "destination": "GOI",
          "originTerminal": "2",
          "duration": 70,
          "mileage": 263,
          "meal": "Snack or Brunch"
         }
        ]
       }
      ]
     }
    ],
    "pricing": [
     {
      "kind": "qpxexpress#pricingInfo",
      "fare": [
       {
        "kind": "qpxexpress#fareInfo",
        "id": "AkRu63nnuA5dw23338g3JUdAlFI0Zu6jduhwlxTcAcPJa",
        "carrier": "9W",
        "origin": "DEL",
        "destination": "BOM",
        "basisCode": "O2IPOB"
       },
       {
        "kind": "qpxexpress#fareInfo",
        "id": "AWp73KM05NBaJGBqhF1XSCptW7yuanMh8rhFtWDH5OGjR",
        "carrier": "9W",
        "origin": "BOM",
        "destination": "GOI",
        "basisCode": "S2IPOA"
       }
      ],
      "segmentPricing": [
       {
        "kind": "qpxexpress#segmentPricing",
        "fareId": "AkRu63nnuA5dw23338g3JUdAlFI0Zu6jduhwlxTcAcPJa",
        "segmentId": "GQsVPyTH7JS0w8W3"
       },
       {
        "kind": "qpxexpress#segmentPricing",
        "fareId": "AWp73KM05NBaJGBqhF1XSCptW7yuanMh8rhFtWDH5OGjR",
        "segmentId": "GiFXczU-NuCGjTvt"
       }
      ],
      "baseFareTotal": "INR5370",
      "saleFareTotal": "INR5370",
      "saleTaxTotal": "INR1780",
      "saleTotal": "INR7150",
      "passengers": {
       "kind": "qpxexpress#passengerCounts",
       "adultCount": 1
      },
      "tax": [
       {
        "kind": "qpxexpress#taxInfo",
        "id": "JN_004",
        "chargeType": "GOVERNMENT",
        "code": "JN",
        "country": "IN",
        "salePrice": "INR301"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "F2_001",
        "chargeType": "GOVERNMENT",
        "code": "F2",
        "country": "IN",
        "salePrice": "INR12"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "G1_001",
        "chargeType": "GOVERNMENT",
        "code": "G1",
        "country": "IN",
        "salePrice": "INR12"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "YQ_F",
        "chargeType": "CARRIER_SURCHARGE",
        "code": "YQ",
        "salePrice": "INR600"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "JN_004",
        "chargeType": "GOVERNMENT",
        "code": "JN",
        "country": "IN",
        "salePrice": "INR39"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "F2_001",
        "chargeType": "GOVERNMENT",
        "code": "F2",
        "country": "IN",
        "salePrice": "INR1"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "G1_001",
        "chargeType": "GOVERNMENT",
        "code": "G1",
        "country": "IN",
        "salePrice": "INR1"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "YR_F",
        "chargeType": "CARRIER_SURCHARGE",
        "code": "YR",
        "salePrice": "INR100"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "WO_001",
        "chargeType": "GOVERNMENT",
        "code": "WO",
        "country": "IN",
        "salePrice": "INR150"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "IN_001",
        "chargeType": "GOVERNMENT",
        "code": "IN",
        "country": "IN",
        "salePrice": "INR564"
       }
      ],
      "fareCalculation": "DEL 9W X/BOM Q70 1600O2IPOB 9W GOI 3700S2IPOA INR 5370 END XT 13F2 13G1 564IN 340JN 150WO 600YQ 100YR",
      "latestTicketingTime": "2016-09-30T04:29-04:00",
      "ptc": "ADT",
      "refundable": true
     }
    ]
   },
   {
    "kind": "qpxexpress#tripOption",
    "saleTotal": "INR7256",
    "id": "aMAwBkJhzg6MkshLiUYI1I002",
    "slice": [
     {
      "kind": "qpxexpress#sliceInfo",
      "duration": 240,
      "segment": [
       {
        "kind": "qpxexpress#segmentInfo",
        "duration": 125,
        "flight": {
         "carrier": "9W",
         "number": "340"
        },
        "id": "G--sPgzaUpFFzGE0",
        "cabin": "COACH",
        "bookingCode": "O",
        "bookingCodeCount": 7,
        "marriedSegmentGroup": "0",
        "leg": [
         {
          "kind": "qpxexpress#legInfo",
          "id": "LBHC78+RLCaWmwkO",
          "aircraft": "73H",
          "arrivalTime": "2016-09-30T14:45+05:30",
          "departureTime": "2016-09-30T12:40+05:30",
          "origin": "DEL",
          "destination": "BOM",
          "originTerminal": "3",
          "destinationTerminal": "2",
          "duration": 125,
          "mileage": 706,
          "meal": "Lunch"
         }
        ],
        "connectionDuration": 35
       },
       {
        "kind": "qpxexpress#segmentInfo",
        "duration": 80,
        "flight": {
         "carrier": "9W",
         "number": "2384"
        },
        "id": "GlMXLseySzJWEpZf",
        "cabin": "COACH",
        "bookingCode": "S",
        "bookingCodeCount": 7,
        "marriedSegmentGroup": "1",
        "leg": [
         {
          "kind": "qpxexpress#legInfo",
          "id": "LbOsZAScdZluLagp",
          "aircraft": "73H",
          "arrivalTime": "2016-09-30T16:40+05:30",
          "departureTime": "2016-09-30T15:20+05:30",
          "origin": "BOM",
          "destination": "GOI",
          "originTerminal": "2",
          "duration": 80,
          "mileage": 263,
          "meal": "Snack or Brunch"
         }
        ]
       }
      ]
     }
    ],
    "pricing": [
     {
      "kind": "qpxexpress#pricingInfo",
      "fare": [
       {
        "kind": "qpxexpress#fareInfo",
        "id": "AkRu63nnuA5dw23338g3JUdAlFI0Zu6jduhwlxTcAcPJa",
        "carrier": "9W",
        "origin": "DEL",
        "destination": "BOM",
        "basisCode": "O2IPOB"
       },
       {
        "kind": "qpxexpress#fareInfo",
        "id": "AWp73KM05NBaJGBqhF1XSCptW7yuanMh8rhFtWDH5OGjR",
        "carrier": "9W",
        "origin": "BOM",
        "destination": "GOI",
        "basisCode": "S2IPOA"
       }
      ],
      "segmentPricing": [
       {
        "kind": "qpxexpress#segmentPricing",
        "fareId": "AkRu63nnuA5dw23338g3JUdAlFI0Zu6jduhwlxTcAcPJa",
        "segmentId": "G--sPgzaUpFFzGE0"
       },
       {
        "kind": "qpxexpress#segmentPricing",
        "fareId": "AWp73KM05NBaJGBqhF1XSCptW7yuanMh8rhFtWDH5OGjR",
        "segmentId": "GlMXLseySzJWEpZf"
       }
      ],
      "baseFareTotal": "INR5470",
      "saleFareTotal": "INR5470",
      "saleTaxTotal": "INR1786",
      "saleTotal": "INR7256",
      "passengers": {
       "kind": "qpxexpress#passengerCounts",
       "adultCount": 1
      },
      "tax": [
       {
        "kind": "qpxexpress#taxInfo",
        "id": "JN_004",
        "chargeType": "GOVERNMENT",
        "code": "JN",
        "country": "IN",
        "salePrice": "INR307"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "F2_001",
        "chargeType": "GOVERNMENT",
        "code": "F2",
        "country": "IN",
        "salePrice": "INR12"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "G1_001",
        "chargeType": "GOVERNMENT",
        "code": "G1",
        "country": "IN",
        "salePrice": "INR12"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "YQ_F",
        "chargeType": "CARRIER_SURCHARGE",
        "code": "YQ",
        "salePrice": "INR600"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "JN_004",
        "chargeType": "GOVERNMENT",
        "code": "JN",
        "country": "IN",
        "salePrice": "INR39"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "F2_001",
        "chargeType": "GOVERNMENT",
        "code": "F2",
        "country": "IN",
        "salePrice": "INR1"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "G1_001",
        "chargeType": "GOVERNMENT",
        "code": "G1",
        "country": "IN",
        "salePrice": "INR1"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "YR_F",
        "chargeType": "CARRIER_SURCHARGE",
        "code": "YR",
        "salePrice": "INR100"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "WO_001",
        "chargeType": "GOVERNMENT",
        "code": "WO",
        "country": "IN",
        "salePrice": "INR150"
       },
       {
        "kind": "qpxexpress#taxInfo",
        "id": "IN_001",
        "chargeType": "GOVERNMENT",
        "code": "IN",
        "country": "IN",
        "salePrice": "INR564"
       }
      ],
      "fareCalculation": "DEL 9W X/BOM Q70 1600O2IPOB 9W GOI Q100 3700S2IPOA INR 5470 END XT 13F2 13G1 564IN 346JN 150WO 600YQ 100YR",
      "latestTicketingTime": "2016-09-30T03:09-04:00",
      "ptc": "ADT",
      "refundable": true
     }
    ]
   }
  ]
 }
}
