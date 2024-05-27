<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, java.util.List, com.yojulab.study_springboot.utils.Paginations" %>
<%@ page import="java.util.Map" %>

<%@ include file="/WEB-INF/rarefield/views/commons/header.jsp" %>

<style>

    .image-container {
        position: relative;
        width: 100%; /* 이미지의 너비에 맞춰 조정하세요 */
        height: 450px; /* 이미지의 높이에 맞춰 조정하세요 */
        display: flex;
        justify-content: center;
        align-items: center;

      }
      
      .image-container img {
        position: absolute;
        margin: auto;
      }
      
      .top-image {
        z-index: 1; /* 이 값이 더 크면 해당 이미지가 위에 표시됩니다 */
      }
      
      .bottom-image {
        z-index: 0;
      }
</style>

<div class="image-container mb-5">
    <img class="container-fluid" src="http://rare-field.shop/data/img/wordcloud.png" alt="" class="bottom-image">
    <img class="container-fluid" src="http://rare-field.shop/data/img/logo_in_cloud.png" alt="" class="top-image">
</div>

<main class="row justify-content-between">

    <%@ include file="/WEB-INF/rarefield/views/commons/side_left_banner.jsp" %>


    <div class="col-8 row">
        <div class="container">
            <form class="">
                <div class="row justify-content-center" style="align-items: center;">
                    <div class="col-2">
                        <select class="form-select" style="border-radius: 45px;box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);"
                            id="search_select" required="" name="key_name" height="50px">
                            <option value="">전체</option>
                            <option value="dise_name_kr">희귀질환</option>
                            <option value="institution_name">의료기관</option>
                        </select>
                    </div>
                    <div class="col-5">
                        <input class="form-control" style="border-radius: 45px;box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);"
                            height="50px" placeholder="Enter Search!" name="search_word" id="search_word">
                    </div>
        
        
                    <div class="col-2">
                        <button type="button" id="search_word" style="border: none; background: none; padding: 0;"
                            onclick="search()">
                            <svg width="50" height="50" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g filter="url(#filter0_d_7_45)">
                                    <path
                                        d="M5 40C5 20.67 20.67 5 40 5C59.33 5 75 20.67 75 40C75 59.33 59.33 75 40 75C20.67 75 5 59.33 5 40Z"
                                        fill="#04CBFC" fill-opacity="0.47" shape-rendering="crispEdges" />
                                </g>
                                <path d="M35 50L45 40L35 30" stroke="white" stroke-width="5" stroke-linecap="round" />
                                <defs>
                                    <filter id="filter0_d_7_45" x="0" y="0" width="80" height="80" filterUnits="userSpaceOnUse"
                                        color-interpolation-filters="sRGB">
                                        <feFlood flood-opacity="0" result="BackgroundImageFix" />
                                        <feColorMatrix in="SourceAlpha" type="matrix"
                                            values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                                        <feOffset />
                                        <feGaussianBlur stdDeviation="2.5" />
                                        <feComposite in2="hardAlpha" operator="out" />
                                        <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0" />
                                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_7_45" />
                                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_7_45"
                                            result="shape" />
                                    </filter>
                                </defs>
                            </svg>
                        </button>
                        <br>
                    </div>
                </div>
            </form>
        
            <div class="row justify-content-center  text-center container p-3" style="">
                <div class="p-3 text-decoration-none " style="font-size:larger; font-weight: 700; ">
                    📝(어떤어떤 희귀질환자의 보호자인)당신을 위한 추천 뉴스
                </div>
                <div class="row justify-content-center">

                    <%
                    List<Map<String,Object>> records = (List<Map<String,Object>>) session.getAttribute("newsRecords");
                    if (records != null) {
                        for(int i = 0 ; i < records.size() ; i++) {
                            HashMap<String, Object> record = (HashMap<String, Object>) records.get(i);
                    %>
                    <div class=" col-2 card ms-2 me-2"
                        style="width: 18rem;border-radius: 25px;  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);">
                        <div class="card-body">
                            <a href="/trend/read/<%= record.get("_id") %>" class="card-link text-decoration-none">
                                <h5 class="card-title"><%= record.get("news_title") %></h5>
                            </a>
                            <h6 class="card-subtitle mb-2 text-body-secondary"><%= record.get("news_paper") %></h6>
                            <p class="card-text"></p>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>

        
    <%@ include file="/WEB-INF/rarefield/views/commons/side_right_banner.jsp" %>

      
    </main>
    <hr>
    <%@ include file="/WEB-INF/rarefield/views/commons/footer.jsp" %>


    <script type="text/javascript">

        document.getElementById("search_word").addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                event.preventDefault(); // 폼이 실제로 제출되는 것을 방지
                search(); // 검색 함수 실행
            }
        });

        function search() {
            var search_select = document.getElementById("search_select").value;
            var search_word = document.getElementById("search_word").value;

            if (search_select && search_word) {
                var formAction = '';


                // 동적으로 폼 생성하고 제출
                var form = document.createElement('form');
                form.method = 'POST';
                if (search_select === 'dise_name_kr') {
                    formAction = '/info/info_raredisease'
                    form.action = formAction + '?key_name=' + encodeURIComponent(search_select) + '&search_word=' + encodeURIComponent(search_word);
                } else if (search_select === 'institution_name') {
                    formAction = '/info/info_institution'
                    form.action = formAction + '?keyword=' + encodeURIComponent(search_word);
                }


                document.body.appendChild(form);
                form.submit();
            } else {
                alert('선택과 검색어를 모두 입력해주세요.');
            }
        }

      
    </script>
    

    </html>