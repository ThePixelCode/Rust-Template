let set_license = variable::get("license");

if !set_license {
  file::rename("LICENSE-GPL-3", "LICENSE");
  file::delete("LICENSE-APACHE-2");
  file::delete("LICENSE-MIT");
  exit();
}

let gpl = variable::prompt("Add GPL-v3?", false);
let mit = variable::prompt("Add MIT?", false);
let apache = variable::prompt("Add Apache-v2?", false);
let license = 0;
if gpl {
  license += 1;
}
if mit {
  license += 1;
}
if apache {
  license += 1;
}

if license <= 1 {
  if gpl {
    file::rename("LICENSE-GPL-3", "LICENSE");
    file::delete("LICENSE-APACHE-2");
    file::delete("LICENSE-MIT");
  } else if mit {
    file::rename("LICENSE-MIT", "LICENSE");
    file::delete("LICENSE-APACHE-2");
    file::delete("LICENSE-GPL-3");
  } else if apache {
    file::rename("LICENSE-APACHE-2", "LICENSE");
    file::delete("LICENSE-GPL-3");
    file::delete("LICENSE-MIT");
  } else {
    throw "PLEASE SELECT A LICENSE";
  }
} else {
  let licenses = ["gpl-v3", "mit", "apache-v2"];
  if gpl {
    licenses.remove(licenses.index_of(|a| a == "gpl-v3"));
  }
  if mit {
    licenses.remove(licenses.index_of(|a| a == "mit"));
  }
  if apache {
    licenses.remove(licenses.index_of(|a| a == "apache-v2"));
  }
  for i in licenses {
    switch i {
      "gpl-v3" => file::delete("LICENSE-GPL-3"),
      "mit" => file::delete("LICENSE-MIT"),
      "apache-v2" => file::delete("LICENSE-APACHE-2"),
    }
  }
}
