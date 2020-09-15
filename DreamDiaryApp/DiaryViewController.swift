
import UIKit
import TagListView

class DiaryViewController: UIViewController, TagListViewDelegate, UITextFieldDelegate {
    
    let MARGIN: CGFloat = 10

        let tagListView = TagListView()
        let textField = UITextField()

        override func viewDidLoad() {
            super.viewDidLoad()
            self.setView()
        }
        func setView() {

            view.addSubview(tagListView)
            view.addSubview(textField)

            tagListView.frame = CGRect(x: MARGIN, y: 50, width: view.frame.width-MARGIN*2, height: 0)

            // タグの削除ボタンを有効に
            tagListView.enableRemoveButton = true

            // 今回は削除ボタン押された時の処理を行う
            tagListView.delegate = self

        // タグの見た目を設定
            tagListView.alignment = .left
            tagListView.cornerRadius = 3
            tagListView.textColor = UIColor.black
        tagListView.borderColor = UIColor.lightGray
            tagListView.borderWidth = 1
            tagListView.paddingX = 10
        tagListView.paddingY = 5
            tagListView.textFont = UIFont.systemFont(ofSize: 16)
            tagListView.tagBackgroundColor = UIColor.white

            // タグ削除ボタンの見た目を設定
        tagListView.removeButtonIconSize = 10
            tagListView.removeIconLineColor = UIColor.black

            // テキストフィールドは適当にセット
            textField.delegate = self
        textField.placeholder = "タグを入力してください"
            textField.returnKeyType = UIReturnKeyType.done

            // レイアウト調整
        updateLayout()
        }

        // テキストフィールドの完了ボタンが押されたら
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if 0 < textField.text!.count {
                // タグを追加
                tagListView.addTag(textField.text!)

                // テキストフィールドをクリアしてレイアウト調整
                textField.text = nil
                updateLayout()
            }
            return true
        }

        // タグ削除ボタンが押された
        func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        // リストからタグ削除
            sender.removeTagView(tagView)
            updateLayout()
        }

        func updateLayout() {
            // タグ全体の高さを取得
            tagListView.frame.size = tagListView.intrinsicContentSize

            textField.frame = CGRect(x: MARGIN, y: tagListView.frame.origin.y + tagListView.frame.height + 5, width: view.frame.width-MARGIN*2, height: 40)
        }
    }


    



