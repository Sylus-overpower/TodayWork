USE [TodayWorkWork]
GO
/****** Object:  StoredProcedure [dbo].[ListSearch]    Script Date: 2020-06-26 오전 11:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		권희경
-- Create date: 2020-06-26
-- Description:	구직목록 뿌리고 정렬하는 기능, 회사정보 뿌리고 정렬하는 기능을 실행하는 프로시저
-- =============================================
ALTER PROCEDURE [dbo].[ListSearch]
	@table_name nvarchar(50),
	@order_col_name nvarchar(50),
	@search_on nvarchar(10),
	@search_choice nvarchar(10),
	@search_keyword nvarchar(50)
AS
BEGIN
	IF(@table_name = 'RECRUIT')
			IF(@order_col_name = 'com_name')
				IF(@search_on='true')
					IF(@search_choice='true')
							select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by COM_NAME ASC, W_NUM DESC;
					ELSE
							select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by COM_NAME DESC, W_NUM DESC;
				ELSE
					IF(@search_choice='true')
							select * from RECRUIT order by COM_NAME ASC, W_NUM DESC;
					ELSE
							select * from RECRUIT order by COM_NAME DESC, W_NUM DESC;
		
			ELSE IF(@order_col_name = 'subject')
				IF(@search_on='true')
					IF(@search_choice='true')
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by SUBJECT DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by SUBJECT ASC, W_NUM DESC;
				ELSE
					IF(@search_choice='true')
						select * from RECRUIT order by SUBJECT DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT order by SUBJECT ASC, W_NUM DESC;
			ELSE IF(@order_col_name = 'count')
				IF(@search_on='true')
					IF(@search_choice='true')
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by COUNT DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by COUNT ASC, W_NUM DESC;
				ELSE
					IF(@search_choice='true')
						select * from RECRUIT order by COUNT DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT order by COUNT ASC, W_NUM DESC;
			ELSE IF(@order_col_name = 'pay')
				IF(@search_on='true')
					IF(@search_choice='true')
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by PAY DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by PAY ASC, W_NUM DESC;
				ELSE
					IF(@search_choice='true')
						select * from RECRUIT order by PAY DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT order by PAY ASC, W_NUM DESC;
	
			ELSE IF(@order_col_name = 'w_end_time')
				IF(@search_on='true')
					IF(@search_choice='true')
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by W_END_TIME DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by W_END_TIME ASC, W_NUM DESC;
				ELSE
					IF(@search_choice='true')
						select * from RECRUIT order by W_END_TIME DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT order by W_END_TIME ASC, W_NUM DESC;
			ELSE IF(@order_col_name = 'w_place')
				IF(@search_on='true')
					IF(@search_choice='true')
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by W_PLACE DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT where SUBJECT LIKE '%' + @search_keyword + '%' or COM_NAME LIKE '%' + @search_keyword + '%' order by W_PLACE ASC, W_NUM DESC;
				ELSE
					IF(@search_choice='true')
						select * from RECRUIT order by W_PLACE DESC, W_NUM DESC;
					ELSE
						select * from RECRUIT order by W_PLACE ASC, W_NUM DESC;
			ELSE IF(@order_col_name = 'All')
				SELECT * FROM RECRUIT ORDER BY W_NUM DESC;
			ELSE
				SELECT * FROM RECRUIT WHERE SUBJECT LIKE '%'+@search_keyword+'%' OR COM_NAME LIKE '%'+@search_keyword+'%' ORDER BY SUBJECT ASC, COM_NAME DESC;
				
	ELSE --COM_INFO테이블 이용해서 회사 정보 출력
		IF(@order_col_name = 'letter')
			IF(@search_on='true')
				IF(@search_choice='true')
					select * from COM_INFO where COM_NAME LIKE '%'+@search_keyword+'%' order by COM_NAME ASC;
				ELSE
					select * from COM_INFO where COM_NAME LIKE '%' + @search_keyword + '%' order by COM_NAME DESC;
			ELSE
				IF(@search_choice='true')
					select * from COM_INFO order by COM_NAME ASC;
				ELSE
					select * from COM_INFO order by COM_NAME DESC;
		ELSE IF(@order_col_name='point')
			IF(@search_on='true')
				IF(@search_choice='true')
					select * from COM_INFO where COM_NAME LIKE '%' + @search_keyword + '%' order by STAR_PT ASC;
				ELSE
					select * from COM_INFO where COM_NAME LIKE '%' + @search_keyword + '%' order by STAR_PT DESC;
			ELSE
				IF(@search_choice='true')
					select * from COM_INFO order by STAR_PT ASC;
				ELSE
					select * from COM_INFO order by STAR_PT DESC;
		ELSE IF(@order_col_name='apply')
			IF(@search_on='true')
				IF(@search_choice='true')
					select * from COM_INFO where COM_NAME LIKE '%' + @search_keyword + '%' order by AP_COUNT ASC;
				ELSE
					select * from COM_INFO where COM_NAME LIKE '%' + @search_keyword + '%' order by AP_COUNT DESC;
			ELSE
				IF(@search_choice='true')
					select * from COM_INFO order by AP_COUNT ASC;
				ELSE
					select * from COM_INFO order by AP_COUNT DESC;
		ELSE IF(@order_col_name='All')
			--등록된 회사리스트 전체 출력
			select * from COM_INFO;
		ELSE
			--회사명 검색
			select * from COM_INFO where COM_NAME LIKE '%'+@search_keyword+'%';
	
	
END
