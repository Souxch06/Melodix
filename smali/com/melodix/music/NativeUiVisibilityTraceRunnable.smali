.class final Lcom/melodix/music/NativeUiVisibilityTraceRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final root:Landroid/view/View;
.field private attempts:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Landroid/view/View;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeUiVisibilityTraceRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeUiVisibilityTraceRunnable;->root:Landroid/view/View;
    return-void
.end method

.method public final run()V
    .locals 15

    :try_start_native_layout_trace
    iget-object v0, p0, Lcom/melodix/music/NativeUiVisibilityTraceRunnable;->activity:Lcom/melodix/music/MainActivity;
    iget-object v1, p0, Lcom/melodix/music/NativeUiVisibilityTraceRunnable;->root:Landroid/view/View;
    if-eqz v0, :native_layout_done
    if-eqz v1, :native_layout_done

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z
    move-result v11
    invoke-static {v11}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I
    move-result v5
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I
    move-result v6
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2

    const/4 v3, 0x0
    const/4 v7, 0x0
    const/4 v8, -0x1
    const/4 v9, -0x1
    const/4 v10, 0x0
    if-eqz v2, :native_layout_parent_checked
    const/4 v3, 0x1
    instance-of v7, v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v7, :native_layout_parent_checked
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v8
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v10
    # nativeRoot is a sibling of this horizontal-scroll host; the WebView is
    # inside that host, not a direct sibling of nativeRoot.
    const v11, 0x7f0900ea
    invoke-virtual {v2, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v11
    if-eqz v11, :native_layout_parent_checked
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v9
    :native_layout_parent_checked

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "native-layout shown="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " size="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, "x"
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " parent="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v3, :native_layout_parent_missing
    if-eqz v7, :native_layout_parent_other
    const-string v11, "constraint"
    goto :native_layout_parent_name_ready
    :native_layout_parent_other
    const-string v11, "other"
    goto :native_layout_parent_name_ready
    :native_layout_parent_missing
    const-string v11, "missing"
    :native_layout_parent_name_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " order(root/hscroll/children)="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, "/"
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, "/"
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " elevation="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getElevation()F
    move-result v11
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const-string v11, "MDXTRACE"
    invoke-static {v11, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    # Root layout readiness requires visible non-empty bounds, the expected
    # ConstraintLayout parent, a later sibling position than hScrollView, and
    # greater elevation than that host. This distinguishes a request from a
    # root that can actually cover the WebView.
    const/4 v12, 0x0
    invoke-virtual {v1}, Landroid/view/View;->isShown()Z
    move-result v11
    if-eqz v11, :native_layout_root_checked
    if-lez v5, :native_layout_root_checked
    if-lez v6, :native_layout_root_checked
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-eqz v2, :native_layout_root_checked
    instance-of v11, v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v11, :native_layout_root_checked
    if-ltz v8, :native_layout_root_checked
    if-ltz v9, :native_layout_root_checked
    if-le v8, v9, :native_layout_root_checked
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    const v11, 0x7f0900ea
    invoke-virtual {v2, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v11
    if-eqz v11, :native_layout_root_checked
    invoke-virtual {v1}, Landroid/view/View;->getElevation()F
    move-result v13
    invoke-virtual {v11}, Landroid/view/View;->getElevation()F
    move-result v14
    cmpl-float v11, v13, v14
    if-lez v11, :native_layout_root_checked
    new-instance v2, Landroid/graphics/Rect;
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V
    invoke-virtual {v1, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z
    move-result v11
    if-eqz v11, :native_layout_root_checked
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I
    move-result v11
    if-lez v11, :native_layout_root_checked
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I
    move-result v11
    if-lez v11, :native_layout_root_checked
    const/4 v12, 0x1
    :native_layout_root_checked

    # A measured Web Home owns the Home surface. Report the native root's
    # actual hidden geometry without treating intentional suppression as a
    # failed native visibility attempt or retrying over the Web renderer.
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->isMelodixWebHomeActive()Z
    move-result v11
    if-eqz v11, :native_layout_check_android_visibility
    const/4 v12, 0x0
    const/4 v13, 0x0
    const-string v4, "false"
    goto :native_layout_publish

    :native_layout_check_android_visibility
    # MainActivity owns the private Home state and sets readiness only after it
    # verifies the selected card or status panel's global bounds post-splash.
    invoke-virtual {v0, v12}, Lcom/melodix/music/MainActivity;->completeNativeUiVisibility(Z)Z
    move-result v13
    if-eqz v13, :native_layout_not_ready
    goto :native_layout_publish

    :native_layout_not_ready
    iget v11, p0, Lcom/melodix/music/NativeUiVisibilityTraceRunnable;->attempts:I
    const/4 v14, 0x5
    if-ge v11, v14, :native_layout_give_up
    add-int/lit8 v11, v11, 0x1
    iput v11, p0, Lcom/melodix/music/NativeUiVisibilityTraceRunnable;->attempts:I
    const-wide/16 v2, 0x64
    invoke-virtual {v1, p0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
    goto :native_layout_done

    :native_layout_give_up
    const-string v11, "native-ui-visibility-timeout"
    invoke-static {v11}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v11}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->revealWebUi()V
    const-string v11, "native-shell-visibility-failed"
    invoke-static {v11}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    const/4 v13, 0x0
    const-string v4, "false"

    :native_layout_publish
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "window.__sfNativeUiRootVisibilityKnown=true;window.__sfNativeUiRootVisible="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootWidth="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootHeight="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootParentFound="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v3, :native_parent_false
    const-string v11, "true"
    goto :native_parent_found_ready
    :native_parent_false
    const-string v11, "false"
    :native_parent_found_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootParentConstraint="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v7, :native_parent_constraint_false
    const-string v11, "true"
    goto :native_parent_constraint_ready
    :native_parent_constraint_false
    const-string v11, "false"
    :native_parent_constraint_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootIndex="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiHScrollIndex="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootAboveWebHost="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v12, :native_root_above_host_false
    const-string v11, "true;"
    goto :native_root_above_host_ready
    :native_root_above_host_false
    const-string v11, "false;"
    :native_root_above_host_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiSiblingCount="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootElevation="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getElevation()F
    move-result v11
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    const-string v11, ";window.__sfNativeUiRootLayoutReady="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v12, :native_layout_false
    const-string v11, "true;"
    goto :native_layout_ready
    :native_layout_false
    const-string v11, "false;"
    :native_layout_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, "window.__sfNativeUiVisibilityConfirmed="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v13, :native_confirmed_false
    const-string v11, "true;"
    goto :native_confirmed_ready
    :native_confirmed_false
    const-string v11, "false;"
    :native_confirmed_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, "window.__sfNativeUiHomeContentReady="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v13, :native_home_content_false
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->hasNativeHomeContent()Z
    move-result v14
    if-eqz v14, :native_home_content_false
    const-string v11, "true;"
    goto :native_home_content_ready
    :native_home_content_false
    const-string v11, "false;"
    :native_home_content_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, ";if(typeof window.__sfMelodixHomeTraceFinal==='function')window.__sfMelodixHomeTraceFinal(window.__sfMelodixHomeRenderedCardCount||0);"
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V

    # Correlate the measured nativeRoot state with Web diagnostics using the
    # process SID added by NativeCrashGuard. Only bounded layout facts are kept.
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "native-layout route="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->isNativeHomeScreen()Z
    move-result v11
    if-eqz v11, :native_layout_trace_other_route
    const-string v11, "home"
    goto :native_layout_trace_route_ready
    :native_layout_trace_other_route
    const-string v11, "other"
    :native_layout_trace_route_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " root=1 shown="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, "true"
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v11
    if-eqz v11, :native_layout_trace_shown_false
    const-string v11, "1"
    goto :native_layout_trace_shown_ready
    :native_layout_trace_shown_false
    const-string v11, "0"
    :native_layout_trace_shown_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " visible="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v13, :native_layout_trace_not_visible
    const-string v11, "1"
    goto :native_layout_trace_visible_ready
    :native_layout_trace_not_visible
    const-string v11, "0"
    :native_layout_trace_visible_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " parent="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v3, :native_layout_trace_parent_missing
    if-eqz v7, :native_layout_trace_parent_other
    const-string v11, "constraint"
    goto :native_layout_trace_parent_ready
    :native_layout_trace_parent_other
    const-string v11, "other"
    goto :native_layout_trace_parent_ready
    :native_layout_trace_parent_missing
    const-string v11, "missing"
    :native_layout_trace_parent_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " root-index="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " host-index="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " children="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " width="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " height="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    # Measure the actual WebView and its horizontal host too; their visibility
    # and dimensions are not inferred from nativeRoot's full-screen bounds.
    const-string v11, " webview-shown="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-object v14, v0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v14, :native_layout_trace_webview_hidden
    invoke-virtual {v14}, Landroid/view/View;->isShown()Z
    move-result v11
    if-eqz v11, :native_layout_trace_webview_hidden
    const-string v11, "1"
    goto :native_layout_trace_webview_shown_ready
    :native_layout_trace_webview_hidden
    const-string v11, "0"
    :native_layout_trace_webview_shown_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " webview-width="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v14, :native_layout_trace_webview_width_zero
    invoke-virtual {v14}, Landroid/view/View;->getWidth()I
    move-result v11
    goto :native_layout_trace_webview_width_ready
    :native_layout_trace_webview_width_zero
    const/4 v11, 0x0
    :native_layout_trace_webview_width_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " webview-height="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v14, :native_layout_trace_webview_height_zero
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I
    move-result v11
    goto :native_layout_trace_webview_height_ready
    :native_layout_trace_webview_height_zero
    const/4 v11, 0x0
    :native_layout_trace_webview_height_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, " host-shown="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const v11, 0x7f0900ea
    invoke-virtual {v0, v11}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v14
    if-eqz v14, :native_layout_trace_host_hidden
    invoke-virtual {v14}, Landroid/view/View;->isShown()Z
    move-result v11
    if-eqz v11, :native_layout_trace_host_hidden
    const-string v11, "1"
    goto :native_layout_trace_host_shown_ready
    :native_layout_trace_host_hidden
    const-string v11, "0"
    :native_layout_trace_host_shown_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v11, " host-width="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v14, :native_layout_trace_host_width_zero
    invoke-virtual {v14}, Landroid/view/View;->getWidth()I
    move-result v11
    goto :native_layout_trace_host_width_ready
    :native_layout_trace_host_width_zero
    const/4 v11, 0x0
    :native_layout_trace_host_width_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " host-height="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v14, :native_layout_trace_host_height_zero
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I
    move-result v11
    goto :native_layout_trace_host_height_ready
    :native_layout_trace_host_height_zero
    const/4 v11, 0x0
    :native_layout_trace_host_height_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, " order="
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-ltz v8, :native_layout_trace_order_fail
    if-ltz v9, :native_layout_trace_order_fail
    if-le v8, v9, :native_layout_trace_order_fail
    const-string v11, "pass"
    goto :native_layout_trace_order_ready
    :native_layout_trace_order_fail
    const-string v11, "fail"
    :native_layout_trace_order_ready
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V

    :try_end_native_layout_trace
    .catch Ljava/lang/Throwable; {:try_start_native_layout_trace .. :try_end_native_layout_trace} :catch_native_layout_trace
    goto :native_layout_done

    :catch_native_layout_trace
    move-exception v0
    const-string v0, "MDXTRACE"
    const-string v1, "native-layout trace failed"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :native_layout_done
    return-void
.end method
