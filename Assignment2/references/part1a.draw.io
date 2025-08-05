<mxfile host="app.diagrams.net" modified="2024-02-16T11:47:50.961Z" agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36" etag="5Ng0adMETkA7yGirq6Cy" version="23.1.5" type="device">
  <diagram id="C5RBs43oDa-KdzZeNtuy" name="Page-1">
    <mxGraphModel dx="1120" dy="447" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" background="#ffffff" math="0" shadow="0">
      <root>
        <mxCell id="WIyWlLk6GJQsqaUBKTNV-0" />
        <mxCell id="WIyWlLk6GJQsqaUBKTNV-1" parent="WIyWlLk6GJQsqaUBKTNV-0" />
        <mxCell id="K3ugDgwktYlbpFzv-rSC-45" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" parent="WIyWlLk6GJQsqaUBKTNV-1" target="K3ugDgwktYlbpFzv-rSC-47" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="414" y="176.608695652174" as="targetPoint" />
            <mxPoint x="414" y="129" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-46" value="&lt;div&gt;1) Open KVM device&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: open(&quot;/dev/kvm&quot;, O_RDWR)&lt;/div&gt;&lt;div&gt;Functionality: Opens the KVM device file(kvm_fd) for communication with the hypervisor.&lt;/div&gt;&lt;div&gt;Returns: kvm_fd&lt;br&gt; &lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="174" y="101" width="479" height="147" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-48" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-47" target="K3ugDgwktYlbpFzv-rSC-49" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="413.5" y="342.17391304347836" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-47" value="&lt;div&gt;2) Verify KVM API version&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(kvm_fd, KVM_GET_API_VERSION, 0)&lt;/div&gt;&lt;div&gt;Parameters: none&lt;/div&gt;&lt;div&gt;Return: constant KVM_API_VERSION&lt;br&gt;&lt;/div&gt;&lt;div&gt;Functionality: Checks the KVM API version supported by the kernel for compatibility. Applications should refuse to run if returns a value other than 12.&lt;span style=&quot;color: rgb(62, 67, 73); font-family: serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;&quot;&gt;&lt;/span&gt; &lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="175" y="283" width="480" height="145" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-52" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-49" target="K3ugDgwktYlbpFzv-rSC-50" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-49" value="&lt;div&gt;3) Create VM&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(kvm_fd, KVM_CREATE_VM, 0)&lt;/div&gt;&lt;div&gt;Parameters: machine type as 0&lt;br&gt;&lt;/div&gt;Returns: vm_fd&lt;div&gt;Functionality: Creates a new virtual machine instance within the KVM hypervisor.&lt;br&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="174" y="468" width="482" height="144" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-101" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-50" target="K3ugDgwktYlbpFzv-rSC-58" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-50" value="&lt;div&gt;4) Set TSS address&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(vm_fd, KVM_SET_TSS_ADDR, tss_addr)&lt;br&gt;&lt;/div&gt;&lt;div&gt;Parameters: unsigned long tss_addr&lt;br&gt;&lt;/div&gt;Returns: 0 on success -1 on error&lt;br&gt;&lt;div&gt;Functionality: This ioctl is required on Intel-based hosts.&lt;span style=&quot;color: rgb(62, 67, 73); font-family: serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;&quot;&gt;&lt;/span&gt;Sets the address of the Task State Segment (TSS) for the VM, necessary for task switching.&lt;br&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="172" y="659" width="486" height="153" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-60" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-55" target="K3ugDgwktYlbpFzv-rSC-59" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-55" value="&lt;div&gt;6) Create vCPU&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(vm_fd, KVM_CREATE_VCPU, 0)&lt;/div&gt;&lt;div&gt;Parameters: vcpu id (apic id on x86)&lt;br&gt;Returns: vcpu fd on success, -1 on error&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Functionality: Creates a virtual CPU (vCPU) within the VM instance.&lt;br&gt;&lt;/div&gt;&lt;div&gt;The vcpus in a given vcore will always be in the same physical core as each other (though that might be a different physical core from time to time).&lt;br&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="160" y="1202" width="510" height="149" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-64" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-58" target="K3ugDgwktYlbpFzv-rSC-55" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-58" value="&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;5) Allocate and map VM memory&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;System call: mmap(NULL, mem_size, protection_flags, map_flag, -1, 0)&lt;/div&gt;&lt;div&gt;Returns: Address of the mapped memory&lt;/div&gt;&lt;div&gt;Functionality: mmap allocates memory in the kvm userspace&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(vm_fd, KVM_SET_USER_MEMORY_REGION, &amp;amp;memreg)&lt;/div&gt;&lt;div&gt;Parameters: struct kvm_userspace_memory_region&lt;/div&gt;&lt;div&gt;Returns: 0 on success, -1 on error&lt;/div&gt;&lt;div&gt;Functionality: maps the allocated kvm userspace memory into the VM&#39;s guest physical address space. userspace_addr inside memreg points to the backing memory in our process that we allocated with mmap()&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="148" y="864" width="534" height="258" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-63" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-59" target="K3ugDgwktYlbpFzv-rSC-62" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-59" value="&lt;div&gt;7) Map vCPU shared memory(kvm_run)&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(vcpu_fd, KVM_GET_VCPU_MMAP_SIZE, 0)&lt;/div&gt;&lt;div&gt;Parameters: none&lt;/div&gt;&lt;div&gt;Returns: size of vcpu mmap area, in bytes&lt;/div&gt;&lt;div&gt;Functionality: The KVM_RUN ioctl communicates with userspace via a shared memory region. This ioctl returns the size of that shared memory region.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;System call: mmap(NULL, vcpu_mmap_size, protection_flags, map_flag, vcpu_fd, 0)&lt;/div&gt;&lt;div&gt;Returns: Address of the mapped memory named as kvm_run.&lt;div&gt;Functionality: Maps the required memory for the vCPU shared memory kvm_run, allowing communication with the host&lt;/div&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="138" y="1403" width="555" height="266" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-102" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-62" target="K3ugDgwktYlbpFzv-rSC-66" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-62" value="&lt;div&gt;8) setup_long_mode by setting Special registers&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(vcpu-&amp;gt;vcpu_fd, KVM_GET_SREGS, &amp;amp;sregs)&lt;/div&gt;&lt;div&gt;Parameters:&amp;nbsp; struct kvm_sregs (output)&lt;br&gt;Returns: 0 on success, -1 on error&lt;/div&gt;&lt;div&gt;Functionality: for retrieving vCPU segment registers.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;API: ioctl(vcpu-&amp;gt;vcpu_fd, KVM_SET_SREGS, &amp;amp;sregs)&lt;br&gt;&lt;/div&gt;&lt;div&gt;Parameters:&amp;nbsp; struct kvm_sregs (input)&lt;br&gt;Returns: 0 on success, -1 on error&lt;/div&gt;&lt;div&gt;Functionality: Writes Special registers updated with proper long_mode specific values into the vcpu.&lt;/div&gt;&lt;div&gt;Special registers includes segment registers, control registers etc.&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="147" y="1715" width="536" height="230" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-70" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-66" target="K3ugDgwktYlbpFzv-rSC-69" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-66" value="&lt;div&gt;9) setup_long_mode by setting general purpose registers&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;API: ioctl(vcpu-&amp;gt;vcpu_fd, KVM_SET_REGS, &amp;amp;regs)&lt;/div&gt;&lt;div&gt;Parameters:&amp;nbsp; struct kvm_regs (input)&lt;br&gt;Returns: 0 on success, -1 on error&lt;/div&gt;&lt;div&gt;Functionality: Writes the general purpose registers including Stack pointer, Instruction pointer into the vcpu.&lt;/div&gt;&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="149" y="1997" width="531.22" height="144" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-103" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-69" target="K3ugDgwktYlbpFzv-rSC-71" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-69" value="&lt;div&gt;10) Load guest code&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;System call: memcpy(vm_mem, guest_code, size)&lt;/div&gt;&lt;div&gt;Functionality: Copies the guest code (e.g., guest64) into the allocated VM memory.&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="188" y="2188" width="453.11" height="93" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-81" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-71" target="K3ugDgwktYlbpFzv-rSC-75" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-71" value="&lt;div&gt;11) Run vCPU&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;API: ioctl(vcpu_fd, KVM_RUN, 0)&lt;/div&gt;&lt;div&gt;Parameters:&amp;nbsp; none&lt;br&gt;&lt;/div&gt;&lt;div&gt;Returns: 0 on success, -1 on error&lt;br&gt;&lt;/div&gt;&lt;div&gt;Functionality: Starts the vCPU execution and waits for it to finish or encounter an exit reason.&lt;/div&gt;" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="169" y="2377" width="492.22" height="139" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-119" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-75" target="K3ugDgwktYlbpFzv-rSC-76" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-75" value="&lt;div&gt;switch&lt;/div&gt;&lt;div&gt;(exit_reason from Guest run)&lt;/div&gt;" style="rounded=1;whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="331" y="2579" width="168.64" height="51" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-99" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-76" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="415.75" y="2780" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-104" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-76" target="K3ugDgwktYlbpFzv-rSC-94" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-76" value="KVM_EXIT_IO" style="rhombus;whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="353.58" y="2665" width="123.5" height="82" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-125" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-94" target="K3ugDgwktYlbpFzv-rSC-71" edge="1">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="772" y="2705" />
              <mxPoint x="772" y="2447" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-94" value="Perform IO" style="rounded=1;whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="548" y="2676" width="120" height="59" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-97" value="continue" style="whiteSpace=wrap;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="731" y="2596" width="65" height="14" as="geometry" />
        </mxCell>
        <mxCell id="K3ugDgwktYlbpFzv-rSC-110" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="K3ugDgwktYlbpFzv-rSC-97" target="K3ugDgwktYlbpFzv-rSC-97" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="QCMiLI6rRITtgA1qjmJx-2" value="END" style="ellipse;whiteSpace=wrap;html=1;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="354" y="2779" width="120" height="80" as="geometry" />
        </mxCell>
        <mxCell id="QCMiLI6rRITtgA1qjmJx-3" value="No" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="414" y="2747" width="33" height="26" as="geometry" />
        </mxCell>
        <mxCell id="QCMiLI6rRITtgA1qjmJx-4" value="Yes" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="490" y="2676" width="38" height="26" as="geometry" />
        </mxCell>
        <mxCell id="QCMiLI6rRITtgA1qjmJx-8" value="START" style="ellipse;whiteSpace=wrap;html=1;" parent="WIyWlLk6GJQsqaUBKTNV-1" vertex="1">
          <mxGeometry x="360" y="6" width="106" height="65" as="geometry" />
        </mxCell>
        <mxCell id="QCMiLI6rRITtgA1qjmJx-9" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;sketch=1;curveFitting=1;jiggle=2;labelBackgroundColor=none;fontColor=default;entryX=0.5;entryY=0;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" parent="WIyWlLk6GJQsqaUBKTNV-1" source="QCMiLI6rRITtgA1qjmJx-8" target="K3ugDgwktYlbpFzv-rSC-46" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="407.31500000000005" y="120.05999999999995" as="targetPoint" />
            <mxPoint x="397" y="97" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
