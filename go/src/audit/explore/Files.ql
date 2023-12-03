/**
 * @name Files
 * @description List of all files in the repository
 * @kind table
 * @id hikae/audit/files
 * @tags audit
 */

import go

from File f
where f.getExtension() = "go" and not f.getRelativePath().matches("%/test/%")
select f.getRelativePath()
