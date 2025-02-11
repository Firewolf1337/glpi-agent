    <p class='infos'>
      <em class='hint'>{
  use URI::Escape;
  Text::Template::fill_in_file("$template_path/mibsupport-sysobjectid-infos.tpl", HASH => $hash)
    || "Error loading mibsupport-rules-sysobjectid.tpl template: $Text::Template::ERROR"}
      </em>
    </p>
    <table>
      <thead>
        <tr>
          <th class='checkbox' title='{_"Revert selection"}'>{ @ordered_sysobjectid ? "
            <label class='checkbox'>
              <input class='checkbox' type='checkbox' name='checkbox/sysobjectid' onclick='toggle_all(this)'>
              <span class='custom-checkbox all_cb'></span>
            </label>
          ": "&nbsp;"
          }</th>
          <th width='20%'>{_"Name"}</th>
          <th width='20%'>{_"OID to match"}</th>
          <th width='20%'>{_"Ruleset"}</th>
          <th>{_"Description"}</th>
        </tr>
      </thead>
      <tbody>{
  $count = 0;
  foreach my $name (@ordered_sysobjectid) {
    my $oid         = $sysobjectid{$name}->{oid}         || "";
    my $rules_list  = $sysobjectid{$name}->{rules}       || "";
    my $description = $sysobjectid{$name}->{description} || "";
    my $rules = join("<br/>",map { "<a href='$url_path/$request?edit=".uri_escape($_)."&currenttab=rules'>$_</a>" } @{$rules_list});
    $OUT .= "
        <tr class='$request'>
          <td class='checkbox'>
            <label class='checkbox'>
              <input class='checkbox' type='checkbox' name='checkbox/sysobjectid/$name'>
              <span class='custom-checkbox'></span>
            </label>
          </td>
          <td class='list' width='20%'><a href='$url_path/$request?edit=".uri_escape($name)."&currenttab=sysobjectid'>$name</a></td>
          <td class='list' width='20%'>$oid</td>
          <td class='list' width='20%'>$rules</td>
          <td class='list'>$description</td>
        </tr>";
    $count++;
  }
  # Handle empty list case
  unless ($count) {
    $OUT .= "
        <tr class='$request'>
          <td width='20px'>&nbsp;</td>
          <td class='list' colspan='5'>"._("empty list")."</td>
        </tr>";
  }
}
      </tbody>
    </table>
    <div class='select-row'>
      <i class='ti ti-corner-left-up arrow-left'></i>
      <button class='secondary' type='submit' name='submit/delete' value='1' alt='{_"Delete"}'><i class='secondary ti ti-trash-filled'></i>{_"Delete"}</button>
      <div class='separation'></div>
      <label class='selection-option'>{_"Associated rules"}:</label>
      <select class='selection-option' name='input/rule'>
        <option{
          $rule = $form{"input/rule"} || "";
          $rule ? "" : " selected"}></option>{
          join("", map { "
        <option".(($rule && $rule eq $_)? " selected" : "").
          " value='$_'>$_</option>"
        } @ordered_rules)}
      </select>
      <button class='secondary' type='submit' name='submit/add/rule' value='1' alt='{_"Add rule"}'><i class='secondary ti ti-playlist-add'></i>{_"Add rule"}</button>
      <button class='secondary' type='submit' name='submit/del/rule' value='1' alt='{_"Remove rule"}'><i class='secondary ti ti-playlist-x'></i>{_"Remove rule"}</button>
    </div>
    <hr/>
    <button class='big-button' type='submit' name='submit/add/sysobjectid' value='1' alt='{_("Add new sysObjectID match")}'><i class='primary ti ti-plus'></i>{_("Add new sysObjectID match")}</button>
