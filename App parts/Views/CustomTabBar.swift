//
//  CustomTabBar.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/21/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var viewState: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 375, height: 75, alignment: .center)
                .cornerRadius(40)
            HStack {

                //1st button
                Button {
                    viewState = 1
                } label: {
                    
                    
                    if viewState == 1 {
                        VStack {
                            Image(systemName: "cloud.sun")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .tint(.primaryTabColor)
                        .padding(.leading, 10)
                        .frame(width: 65)
                    } else {
                        VStack {
                            Image(systemName: "cloud.sun")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .tint(.accentTabColor)
                        .padding(.leading, 10)
                        .frame(width: 65)
                    }
                }//label
                .frame(width: 60, height: 60)
                
                
                //2nd button
                Button {
                    viewState = 2
                } label: {
                    if viewState == 2 {
                        VStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .tint(.primaryTabColor)
                        .padding()
                    } else {
                        VStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .tint(.accentTabColor)
                        .padding()
                    }

                }//label
                .frame(width: 60, height: 60)
                
                //3rd button
                Button {
                    viewState = 3
                } label: {
                    
                    if viewState == 3 {
                        VStack {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33, height: 33)
                        }
                        .tint(.primaryTabColor)
                        .padding()
                    } else {
                        VStack {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33, height: 33)
                        }
                        .tint(.accentTabColor)
                        .padding()
                    }
                }//label
                .frame(width: 60, height: 60)
                
                //4th button
                Button {
                    viewState = 4
                } label: {
                    if viewState == 4 {
                        VStack {
                            Image(systemName: "alarm")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .tint(.primaryTabColor)
                        .padding()
                    } else {
                        VStack {
                            Image(systemName: "alarm")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .tint(.accentTabColor)
                        .padding()
                    }
                }//label
                .frame(width: 60, height: 60)
                
                //5th button
                Button {
                    viewState = 5
                } label: {
                    if viewState == 5 {
                        VStack {
                            Image(systemName: "checkmark.seal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 34, height: 34)
                        }
                        .tint(.primaryTabColor)
                        .frame(width: 55)
                    } else {
                        VStack {
                            Image(systemName: "checkmark.seal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 34, height:34)
                        }
                        .tint(.accentTabColor)
                        .frame(width: 55)
                    }
                }//label
                .frame(width: 60, height: 60)
                
            }//HStack
        }//ZStack
        
        
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(viewState: Binding.constant(3))
    }
}
