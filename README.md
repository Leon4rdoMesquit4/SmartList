# 🧠 SmartList

Um app simples e inteligente para gerenciar sua lista de itens.  

---

## 🛠️ Tecnologias Utilizadas

- **SwiftUI** 
- **MVVM** 
- **CoreData** 
- **DateFormatter** 

---

## 🚀 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/Leon4rdoMesquit4/SmartList/
```
2.	Abra o projeto no Xcode:
   ```bash
cd SmartList
open SmartList.xcodeproj
   ```
3.	Selecione um simulador e execute o app (Cmd + R).

## 🧭 Dificuldade Encontrada

O ponto mais desafiador foi integrar o Core Data de forma reativa dentro da arquitetura MVVM, garantindo que as atualizações fossem refletidas corretamente na interface.

## 💭 O Que Eu Faria Diferente Com Mais Tempo

Se eu tivesse mais tempo, eu deixaria o app ainda mais robusto e modularizado.
Atualmente, a ViewModel concentra parte da lógica de persistência. Com mais tempo, eu separaria essa camada para ser responsável apenas por lidar com o Core Data, mantendo a ViewModel focada apenas na lógica de apresentação.

Também adicionaria:
- Filtros e buscas dentro da lista;
- Testes unitários para a lógica de persistência e ordenação;
- Widgets e atalhos da Siri para adicionar itens rapidamente.

## 🔧 Requisitos
- ### iOS 26+
- ### XCode 16+
