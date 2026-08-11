#' 应收单数据同步任务生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' apPayableUI()
apPayableUI <- function(tabTitle ='BYD应收单同步',
                           colTitles =c('操作区域','操作区域','显示区域'),
                           widthRates =c(6,6,12),
                           func_left = apPayableUI_left,
                           func_right =apPayableUI_right,
                           func_bottom = apPayableUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' apPayableUI_left()
apPayableUI_left <- function() {


  res <- tagList(


    tsui::uiTemplate(templateName = 'BYD应付单上传模板'),
    tsui::mdl_file(id = 'text_apPayable_upload',label ='上传文件' ),


    shiny::actionButton(inputId = 'btn_apPayable_upload',label = '上传文件')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' apPayableUI_bottom()
apPayableUI_right <- function() {
  res <- tagList(

    tsui::mdl_dateRange(id ='text_apPayable_daterange',label = '建议的过账日期' ),

    shiny::actionButton(inputId = 'btn_apPayable_view',label = '按日期查询'),

    tsui::mdl_download_button(id = 'dl_apPayable',label = '下载查询记录到EXCEL'),


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' apPayableUI_bottom()
apPayableUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'apPayable_resultView',label ='结果显示' ))

  )
  return(res)

}
