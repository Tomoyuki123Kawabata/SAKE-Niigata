class Public::PostSakesController < ApplicationController

  def new
    @post_sake = PostSake.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    post_sake = PostSake.new(post_sake_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    post_sake.save
    # 4. 投稿一覧画面へリダイレクト
    redirect_to post_sakes_path
  end

  def index

  end

  def edit
  end

  def show
  end

  private
  # ストロングパラメータ
  def post_sake_params
    params.require(:post_sake).permit(:sake, :explanation, :star, :comment, :user_id, :genre_id)
  end
end
