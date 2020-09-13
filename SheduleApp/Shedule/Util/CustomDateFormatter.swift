//
//  CustomDateFormatter.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/23.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

func customDateFormatter(format: String) -> DateFormatter {
  let formatter = DateFormatter()
  formatter.dateFormat = format
  return formatter
}
