# jewelry
프로젝트쥬얼리사이트를 벤치마킹 결제,장바구니,마이페이지,리뷰 관리자페이지 기능구현

* 사용 언어&TOOL

   * JAVA,JSP,AJAX,CSS,JQUERY,JAVASCRIPT,HTML,JSTL
   * ORACLE DATABASE
   * SPRING FRAMEWORK
   * SQLDEVELOPER
* API

   * IMPORT API(결제시스템)
   * 다음주소 API
   * SUMMERNOTE API


> ლ( ╹ ◡ ╹ ლ) 
프로젝트 진행상황표 : https://docs.google.com/spreadsheets/d/1V8Oi52A1czb2-STzYLy6z15dVXSlf0iCkx4Sjbw6xck/edit?usp=sharing

> 프로젝트 흐름도 : https://docs.google.com/spreadsheets/d/1aNEKs-a-HIASK7nrZ5AGOi4cE5QN7NkIME-xe-vHKYU/edit?usp=sharing

## 7월 23일 자동 구매확정 추가
```c
--------------프로시저--------------
    create or replace PROCEDURE DELIVERY_proc
    IS
      vn_delivery delivery%rowtype;
      cursor c1
      is
      select * from delivery where DEL_DS='배송완료';
    BEGIN
        for vn_delivery in c1 loop
            exit when c1%notfound;
            if(TO_CHAR(vn_delivery.DEL_DATE+8,'YYYY_MM_DD')=TO_CHAR(sysdate,'YYYY_MM_DD')) then
                insert into delivery values(DEL_NUM_SEQ.NEXTVAL,vn_delivery.OR_UNQ,SYSDATE,vn_delivery.OR_NUM,'구매확정');
            end if;
        end loop;
      COMMIT;

    EXCEPTION WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;
    /
    
    --------------JOB--------------
     DECLARE
      v_job_no NUMBER;
    BEGIN
      -- 현재 시간 기준 하루한번 프로시저를 실행하는 잡 등록
      DBMS_JOB.SUBMIT  ( job => v_job_no, 
                         what => 'DELIVERY_proc;',
                         next_date => SYSDATE,
                         interval => 'TRUNC(SYSDATE+1)' );         -- 하루한번 12시마다 동작

      COMMIT;

      -- 시스템에서 자동 생성된 잡 번호 출력
      DBMS_OUTPUT.PUT_LINE('v_job_no : ' || v_job_no);
    END;
    /
   ```
