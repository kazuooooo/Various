#ApplicationControllerクラスを継承
class BooksController < ApplicationController
  #アクションが実行される前に:set_bookを実行する。onlyオプションで指定されたメソッドのときだけ実行される。
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    #@booksにBookオブジェクトを全て代入
    #(@はインスタンス変数,@@はクラス変数)
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    #@bookにBookインスタンスを生成して代入
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    #@bookにBookインスタンスをbook_paramsメソッドを用いて却ってきた値を用いて生成
    @book = Book.new(book_params)

    #リクエストのformatに応じた処理を返す
    respond_to do |format|
      #@model.saveで生成したオブジェクトをデータベースに保存する。結果のtrue/falseが返る
      if @book.save
        #htmlリクエストのときは@モデルを指定することでそのモデルのshowのパスを指定したことになる??
        #notice: redirect to メソッドのオプション通知メッセージを表示
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      #params(渡ってきた値)が:bookというキーを持っていれば、
      #params[:book]は:isbn,:title,:price,...というキーを持つハッシュに対して更新を許可する都いう意味
      params.require(:book).permit(:isbn, :title, :price, :publish, :published, :cd)
    end
end
