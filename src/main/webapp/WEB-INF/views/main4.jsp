<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="template/header.jsp">
        <jsp:param value="인덱스페이지4" name="title"/>
    </jsp:include>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        #map {
            height: 100%;
            width: 100%;
        }
        /* 선택된 버튼의 스타일 */
        .selected {
            background-color: #ff0000; /* 빨강 배경색 */
            color: #ffffff; /* 흰색 텍스트 색상 */
        }

        .custom-button,
        .custom1-button,
        .custom2-button {
            position: absolute;
            top: 150px;
            left: 50px;
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            z-index: 1; /* 맵 위에 버튼이 나타나도록 설정 */

        }

        .custom-button{
            left :1% ;
            top: 34%;
        }

        .custom1-button{
            left :1% ;
            top: 27%;
        }

        .custom2-button{
            left :1% ;
            top: 20%;
        }

        .custom3-button{
            position: absolute;
            top: 12%;
            right: 20%;
            background-color: #e713dc;
            color: #fff;
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            z-index: 1;
        }

        .custom4-button{
            position: absolute;
            top: 12%;
            right: 15%;
            background-color: #f6cf08;
            color: #fff;
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            z-index: 1;
        }

        .custom5-button{
            position: absolute;
            top: 12%;
            right: 10%;
            background-color: #e51717;
            color: #fff;
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            z-index: 1;
        }
        .custom6-button{
            position: absolute;
            top: 12%;
            right: 5%;
            background-color: #26e034;
            color: #fff;
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            z-index: 1;
        }
        .custom7-button
        {
            background-color: #e713dc;
            color: #fff;
        }
        .custom8-button
        {
            background-color: #f6cf08;
            color: #fff;
        }
        .custom9-button
        {
            background-color: #e51717;
            color: #fff;
        }
        .custom10-button
        {
            background-color: #26e034;
            color: #fff;
        }
        .custom10-button
        {
            background-color: rgb(128, 128, 128);
            color: #fff;
        }
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOlK6MrRu11XmdhsLZ16_8oW3Mus8n44s&callback=initMap" async defer></script>

    <script>

        var map;
        var marker;
        var infowindow;

        function initMap() {
            // 맵 초기화 및 구성
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: 35.893653, lng: 128.620130},
                zoom: 15
            });

            // 현재 위치 가져오기
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var userLocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    // 현재 위치를 지도의 중심으로 설정
                    map.setCenter(userLocation);

                    // 마커 추가 (선택 사항)
                    var marker = new google.maps.Marker({
                        position: userLocation,
                        map: map,
                        title: '현재 위치'
                    });

                    function selectCategory(category) {
                        // 모든 버튼의 배경색을 초기 회색으로 변경
                        var buttons = document.querySelectorAll('.food-button1, .concert-button1 , .accident-button1 , .etc-button1');
                        buttons.forEach(function(button) {
                            button.style.backgroundColor = 'r#e713dc';
                        });

                        // 카테고리에 따른 색상을 반환하는 함수 (원하는 색상으로 변경하세요)
                        function getColorForCategory(category) {
                            switch (category) {
                                case '음식':
                                    return '#e713dc';
                                case '공연':
                                    return '#f6cf08';
                                case '사고':
                                    return '#e51717';
                                case '기타':
                                    return '#26e034';
                                default:
                                    return 'gray'; // 기본 색상 (회색)
                            }
                        }
                        // 클릭한 버튼의 배경색을 변경
                        var selectedButton = document.getElementById(category + '-button');
                        selectedButton.style.backgroundColor = getColorForCategory(category);

                        // 여기에서 선택한 카테고리에 대한 작업을 수행합니다.
                        console.log('선택한 카테고리: ' + category);
                    }

                    // 마커 클릭 이벤트 처리
                    marker.addListener('click', function() {
                        // 정보 창 생성
                        var infowindow = new google.maps.InfoWindow({
                            content: '<div><p>카테고리 선택</p>' +
                                '<button  id="food-button1" class="custom7-button , food-button1" style="background-color: #e713dc; color: white;">음식</button>' +
                                '<button onclick="selectCategory()" style="background-color: #f6cf08; color: white;">공연</button>' +
                                '<button onclick="selectCategory()" style="background-color: red; color: white;">사고</button>' +
                                '<button onclick="selectCategory()" style="background-color: #26e034; color: white;">기타</button>' +
                                '<p>추가설명</p>' +
                                '<input type="text" name="extra" class="form-style" placeholder="추가설명을 입력하세요">' +
                                '<button id="cam-button" class="custom10-button" onclick="window.location.href=\'http://localhost/r5\'">사진찍기</button>'
                                +
                                '</div>'
                        });

                        // 정보 창을 마커 위에 표시
                        infowindow.open(map, marker);
                    });
                }, function() {
                    // 위치 정보를 가져오는 데 실패한 경우의 처리 (예: 권한 거부)
                    console.error('현재 위치를 가져오는 데 실패하였습니다.');
                });
            } else {
                // Geolocation을 지원하지 않는 경우의 처리
                console.error('Geolocation을 지원하지 않습니다.');
            }
        }
        // 정보 창 닫기 함수
        function selectCategory(category) {
            // 여기에서 선택한 카테고리에 대한 작업을 수행합니다.
            console.log('선택한 카테고리: ' + category);

            // 정보 창을 닫습니다.
            // closeInfoWindow();
        }
        // "등록하기" 버튼 클릭 이벤트 처리
        document.getElementById('register-button').addEventListener('click', function() {
            // 입력 상자를 나타내는 요소를 가져옴
            var inputContainer = document.getElementById('input-container');

            // 입력 상자를 표시 (CSS로 display 속성을 변경)
            inputContainer.style.display = 'block';
        });

        // "제출" 버튼 클릭 이벤트 처리 (입력 상자가 표시된 후)
        document.getElementById('submit-button').addEventListener('click', function() {
            // 입력 상자의 내용 가져오기
            var inputValue = document.getElementById('input-text').value;

            // 여기에서 입력 상자의 내용을 처리하는 코드를 추가하세요.
            alert('입력된 내용: ' + inputValue);

            // 입력 상자 숨기기
            document.getElementById('input-container').style.display = 'none';
        });

    </script>

</head>
<body>

<main>
    <jsp:include page="body.inc/header.jsp"/>
    <main>
        <%--        <div class="container">--%>
        <div id="button-container">
            <div id="map" style="height: 700px;"></div>
            <button id="refresh-button" class="custom-button">새로고침</button>
            <button id="my-page-button" class="custom1-button">마이페이지</button>
            <button id="register-button" class="custom2-button">등록하기</button>
            <button id="food-button" class="custom3-button">음식</button>
            <button id="concert-button" class="custom4-button">공연</button>
            <button id="accident-button" class="custom5-button">사고</button>
            <button id="etc-button" class="custom6-button">기타</button>

            <%-- 마커 클릭시 버튼--%>

            <!-- 음식 버튼 (초기 배경색: 회색) -->
            <button id="food-button1"  class="custom7-button" onclick="selectCategory('음식')">음식</button>

            <!-- 공연 버튼 (초기 배경색: 회색) -->
            <button id="concert-button1" class="custom8-button" onclick="selectCategory('공연')">공연</button>

            <!-- 사고 버튼 (초기 배경색: 회색) -->
            <button id="accident-button1" class="custom9-button" onclick="selectCategory('사고')">사고</button>

            <!-- 기타 버튼 (초기 배경색: 회색) -->
            <button id="etc-button1" class="custom10-button" onclick="selectCategory('기타')">기타</button>

        </div>
    </main>

</main>
</body>
</html>