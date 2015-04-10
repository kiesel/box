box
===

Development environment managed by vagrant &amp; ansible.

Ansible on Windows
------------------
No ansible required on the *host* system; this box actually uses the shell provisioner
to bootstrap ansible within the guest box (assuming Debian, btw) and uses that to locally
run ansible.
