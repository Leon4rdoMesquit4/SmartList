//
//  ContentView.swift
//  SmartList
//
//  Created by Leonardo Mesquita Alves on 25/10/25.
//

import SwiftUI

struct SmartListView: View {
    @StateObject var viewModel: SmartListViewModel = .init()
    @State var isPresented: Bool = false
    @State private var titleText: String = ""
    @FocusState private var titleFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.mix(with: .gray, by: 0.3)
                    .ignoresSafeArea()
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Sem título")
                                    .foregroundStyle(.gray.mix(with: .white, by: 0.3))
                                    .fontWeight(.semibold)
                                Text(item.date?.slFormatted() ?? "")
                                    .foregroundStyle(.gray)
                                    .font(.footnote)
                            }
                            Spacer(minLength: 12)
                            Button {
                                viewModel.updateItem(entity: item, completed: !item.completed)
                            } label: {
                                Image(systemName: item.completed ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(item.completed ? .blue : .gray)
                                    .font(.title3)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .scrollContentBackground(.hidden)
                .padding(.top)
            }
            .navigationTitle(Text("Smart List"))
            .toolbar {
                ToolbarItem(id: "add", placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .preferredColorScheme(.dark)
            .sheet(isPresented: $isPresented) {
                addItemView
            }
        }
    }
}

private extension SmartListView {
    var addItemView: some View {
        VStack(spacing: 25) {
            Text("Novo item")
                .font(.title2)
                .bold()
            
            HStack(spacing: 10) {
                Image(systemName: "textformat")
                    .foregroundStyle(.secondary)
                TextField("Título", text: $titleText)
                    .bold()
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled(false)
                    .submitLabel(.done)
                    .focused($titleFocused)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 20))
            
            Button {
                if !titleText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    viewModel.addItem(title: titleText)
                    titleText = ""
                    isPresented = false
                }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Salvar")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .contentShape(.rect)
            }
            .buttonStyle(.bordered)
            .tint(.blue)
            .clipShape(.rect(cornerRadius: 14))
            .disabled(titleText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .opacity(titleText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.6 : 1)
            
            Spacer()
        }
        .padding(.top,40)
        .padding(.horizontal,30)
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    SmartListView()
}

