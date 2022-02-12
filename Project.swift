import ProjectDescription
import ProjectDescriptionHelpers


let projectName = "Hagomandal"
let orgName = "NxMachineCorps"

let app = Project.makeAppTarget(name: projectName, dependencies: [.cocoapods(path: ".")])

let project = Project.init(name: projectName, organizationName: orgName, targets: [app])




