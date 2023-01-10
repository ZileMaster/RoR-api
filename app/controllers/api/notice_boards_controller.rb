class Api::NoticeBoardsController < ApplicationController
    def index
        @notice_boards = NoticeBoard.all
        render json: @notice_boards
     end
     
end
