;Title : GUI based label prefix/suffix editing
;Created : 2023.12.08

procedure(addPrefix(prefix)
  cv = geGetEditCellView()
  let((newPin newLabel)
    foreach( obj geGetSelSet()
      if( obj~>pin~>objType=="pin" then
        newPin=strcat(prefix obj~>pin~>term~>name)
        obj~>pin~>term~>name=newPin
        info("The pin has been modified with prefix '%s' !!!", prefix)
      )
      if( obj~>objType=="label" then
        newLabel=strcat(prefix obj~>theLabel)
        obj~>theLabel=newLabel
        info("The label has been modified with prefix '%s' !!!", prefix)
      )
    )
  )
)

procedure(addSuffix(suffix)
  cv = geGetEditCellView()
    let((newPin newLabel)
    foreach( obj geGetSelSet()
      if( obj~>pin~>objType=="pin" then
        newPin=strcat(obj~>pin~>term~>name suffix)
        obj~>pin~>term~>name=newPin
        info("The pin has been modified with suffix '%s' !!!", suffix)
      )
      if( obj~>objType=="label" then
        newLabel=strcat(obj~>theLabel suffix)
        obj~>theLabel=newLabel
        info("The label has been modified with suffix '%s' !!!", suffix)
      )
    )
  )
)

procedure(guiAddAffix()
  let((selectionField textField)
    selectionField = hiCreateCyclicField(
                                          ?name 'selectionField
                                          ?choices list("prefix" "suffix")
                                          ?prompt "Select:"    ;;; FIELD1, a cyclic type
                                          ?defValue "prefix"
                                          ;?callback printf("Selection field value was changed to %s\n", hiGetCurrentForm()~>selectionField~>value)
    )
    textField = hiCreateStringField(
                                      ?name 'textField
                                      ?prompt "Text:"    ;;; FIELD2, a string type
                                      ;?defValue "prefix or suffix"
                                      ;?callback addPrefix(hiGetCurrentForm()~>prefixfield~>value)
                                      ?editable t
    )
; AddPrefixFormSymbol = gensym('WindowForm)
    addAffixForm = hiCreateAppForm(
                                   ?name 'addAffixForm
                                   ?fields list(
                                                list(selectionField 10:10 290:10 120 )
                                                list(textField 10:30 290:30 120 )
                                                )
                                   ?formTitle "Add Prefix/Suffix"
                                   ?callback "addAffixWrapper(hiGetCurrentForm())"
                                   ?buttonLayout `OKCancelApply
    )
  hiDisplayForm(addAffixForm)
  ) ;let
) ; procedure

procedure(addAffixWrapper(form)
  let(((wrap_selection form->selectionField->value) (wrap_value addAffixForm->textField->value))
    if(wrap_selection=="prefix"
      then
        addPrefix(wrap_value)
      else
        addSuffix(wrap_value)
    ) ; if
  ) ; let
) ; procedure

;procedure(selection_cb(form)
;  let((cb_func)
;    if(form->selectionfield->value=="prefix"
;      then
;        addPrefix(form->textfield->value)
;      else
;        addSuffix(form->textfield->value)
;    )
;  );let
;);procedure

/*
procedure( myformDefineFields()
  let((strfld boolfld)
      strfld = hiCreateStringField(
            ?name 'strfld
                  ?prompt "sample string field"    ;;; FIELD1, a string type
                        ?defValue "initial string"
                              ?callback "my_strfld_cb(hiGetCurrentForm())"
                                    ?editable t
                                      )
          ; Create a Boolean button for the form.
              boolfld = hiCreateBooleanButton(
                    ?name 'boolfld
                          ?buttonText "sample boolean field"        ;;; FIELD2, a boolean type
                                ?defValue t
                                      ?callback "my_boolfld_cb(hiGetCurrentForm())"
                                          )
                  list( strfld boolfld )
                    )
  )
; Generate the form
/*
procedure( myformCreateForm()
  if( !boundp(`myformglb) || (myformglb == nil)
              then
                  myformglb = hiCreateAppForm(
                        ?name `myformglb
                              ?fields myformDefineFields()
                                    ?formTitle "My first Form"
                                          ?callback 'myformglb_cb
                                                ?buttonLayout `OKCancelApply
                                                    )
                    )
            myformglb
            )
procedure(myformglb_cb(form)
  printf("Field values are: %s and %L\n" form->strfld->value form->boolfld->value)
  )
procedure(my_strfld_cb(form)
  printf("String field changed to %s\n" form->strfld->value)
  )
procedure(my_boolfld_cb(form)
  printf("Boolean field changed to %L\n" form->boolfld->value)
  )
; Display the form
procedure( myformDisplayForm()
  myformCreateForm()    ;;; Creation and Display are separate
    hiDisplayForm(`myformglb)
    )
;myformDisplayForm()
*/
;modeless vs modal : whether you can do another progress when you get the dialog box
;modelss diaglog box
/*
hiDisplayAppDBox(
    ?name gensym('TrdBox)
    ?dboxBanner "Example"
    ?dboxText "First \nSecond Line\nThird Line "
    ?dialogType hicInformationDialog
    ?callback "printf(\"\nExecuting Callback ..done\")"
    ?dialogStyle 'modeless)
*/



;modal dialog box
/*
hiDisplayAppDBox(
    ?name gensym('TrdBox)
    ?dboxBanner "Example"
    ?dboxText "First \nSecond Line\nThird Line "
    ?dialogType hicInformationDialog
    ?callback "printf(\"\nExecuting Callback ..done\")"
    ?dialogStyle 'modal)
*/
