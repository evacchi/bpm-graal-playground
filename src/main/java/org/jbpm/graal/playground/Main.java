package org.jbpm.graal.playground;

import org.drools.core.RuleBaseConfiguration;
import org.drools.core.WorkingMemory;
import org.drools.core.common.InternalWorkingMemory;
import org.drools.core.impl.KnowledgeBaseImpl;
import org.drools.core.runtime.process.InternalProcessRuntime;
import org.drools.core.runtime.process.ProcessRuntimeFactory;
import org.drools.core.runtime.process.ProcessRuntimeFactoryService;
import org.jbpm.process.instance.ProcessRuntimeImpl;
import org.jbpm.ruleflow.core.RuleFlowProcess;
import org.jbpm.ruleflow.core.RuleFlowProcessFactory;
import org.kie.api.runtime.process.ProcessInstance;

public class Main {

    public static void main(String[] args) {
        RuleFlowProcessFactory factory =
                RuleFlowProcessFactory.createProcess("org.kie.api2.MyProcessUnit");
        factory
                // Header
                .name("HelloWorldProcess")
                .version("1.0")
                .packageName("org.jbpm")
                // Nodes
                .startNode(1).name("Start").done()
//                .actionNode(2).name("Action")
//                .action("java", "System.out.println(\"Hello World1\");").done()
                .endNode(2).name("End").done()
                // Connections
                .connection(1, 2);
//                .connection(2, 3);
        RuleFlowProcess process = factory.validate().getProcess();

        KnowledgeBaseImpl kb = new KnowledgeBaseImpl("1", new RuleBaseConfiguration());
        kb.addProcess(process);
        ProcessRuntimeFactoryService svc = ProcessRuntimeFactory.getProcessRuntimeFactoryService();
        ProcessUnitDummyWorkingMemory wm = new ProcessUnitDummyWorkingMemory(kb);
        InternalProcessRuntime rt = svc.newProcessRuntime(wm);
        wm.setProcessRuntime(rt);
        ProcessInstance pi = rt.startProcess("org.kie.api2.MyProcessUnit");
    }
}
