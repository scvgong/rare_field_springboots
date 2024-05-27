<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/rarefield/views/commons/header.jsp" %>

<style>


</style>



<main class="row justify-content-between">

    <%@ include file="/WEB-INF/rarefield/views/commons/side_left_banner.jsp" %>

    <div class="col-8 row">
      <main class="container">
        <form action="" method="POST" id="myForm">
          <div class="mb-3">
            <div class="row m-5">
              <label class="col-2" for="title">제목</label>
              <input type="" class="form-control col" name="ques_title" id="title" required>
            </div>
            <div class="row m-5">
              <label class="col-2" for="writer">글쓴이</label>
              <input type="" class="form-control col" name="ques_writer" id="writer" required>
            </div>
            <div class="row m-5">
              <label  class="col-2" for="content">내용</label>
              <textarea type="" class="form-control text-box  col" name="ques_content" id="content" placeholder="내용을 입력하세요."
                required></textarea>
            </div>
            <button class="btn btn-primary" type="submit" formaction="/other/other_QnA_main" formmethod="post">글쓰기</button>
            <a href="/other/other_QnA_main" class="btn btn-danger">취소</a>
          </div>
        </form>
      </main>
    </div>

    <%@ include file="/WEB-INF/rarefield/views/commons/side_right_banner.jsp" %>

      
    </main>
    <hr>
    <%@ include file="/WEB-INF/rarefield/views/commons/footer.jsp" %>

    <script>
    

      
    </script>
    

    </html>