class Public::PostSakesController < ApplicationController

  def new
    @post_sake = PostSake.new
  end

  def create
    @post_sake = PostSake.new(post_sake_params) # １.&2. データを受け取り新規登録するためのインスタンス作成
    @post_sake.user_id = current_user.id
    if @post_sake.save # 3. データをデータベースに保存するためのsaveメソッド実行
      redirect_to post_sake_path(@post_sake.id)
      flash[:notice] = "投稿が成功しました"
    else
      render :new
    end
    
    
  end

  def index
   @post_sakes = PostSake.all
  end

  def edit
    @post_sake = PostSake.find(params[:id])
  end
  
  def update
    post_sake = PostSake.find(params[:id])
    post_sake.update(post_sake_params)
    redirect_to post_sake_path(post_sake.id)
  end

  def show
    @post_sake = PostSake.find(params[:id])  
  end
  
  def destroy
    post_sake = PostSake.find(params[:id])  # データ（レコード）を1件取得
    post_sake.destroy  # データ（レコード）を削除
    redirect_to post_sakes_path  # 投稿一覧画面へリダイレクト  
  end

  private
  # ストロングパラメータ
  def post_sake_params
    params.require(:post_sake).permit(:sake, :comment, :image)
  end
end
