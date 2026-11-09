.class public final Lcom/melodix/music/NativeSessionSurfaceExtras;
.super Ljava/lang/Object;
.method public static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .locals 2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "id"
    invoke-static {v0, p1, v1}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    return-object v0
.end method
.method public static button(Lcom/melodix/music/MainActivity;Landroid/view/View;I)V
    .locals 1
    const/4 v0, 0x0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
    new-instance v0, Lcom/melodix/music/NativeSessionSurfaceAction;
    invoke-direct {v0, p0, p2}, Lcom/melodix/music/NativeSessionSurfaceAction;-><init>(Lcom/melodix/music/MainActivity;I)V
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    return-void
.end method
.method public static bind(Lcom/melodix/music/MainActivity;Landroid/view/View;I)V
    .locals 4
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :done
    const/4 v0, 0x2
    if-ne p2, v0, :details
    const-string v0, "sessionSecondary"
    invoke-static {p1, v0}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
    const-string v1, "Réessayer"
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeSessionSurfaceExtras;->button(Lcom/melodix/music/MainActivity;Landroid/view/View;I)V
    const-string v0, "sessionNotice"
    invoke-static {p1, v0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :details
    const/4 v0, 0x2
    if-eq p2, v0, :show_details
    const/4 v0, 0x4
    if-ne p2, v0, :pulse
    :show_details
    const-string v0, "sessionDetails"
    invoke-static {p1, v0}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
    invoke-static {}, Lcom/melodix/music/NativeSessionGate;->details()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v0, "sessionDisclosure"
    invoke-static {p1, v0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    const/4 v1, 0x3
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeSessionSurfaceExtras;->button(Lcom/melodix/music/MainActivity;Landroid/view/View;I)V
    const-string v0, "sessionCopy"
    invoke-static {p1, v0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    const/4 v1, 0x4
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeSessionSurfaceExtras;->button(Lcom/melodix/music/MainActivity;Landroid/view/View;I)V
    :pulse
    # Motion is decorative only and only while verifying; animator scale 0 means no motion.
    if-nez p2, :done
    invoke-static {p0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->motion(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :done
    const-string v0, "sessionLogo"
    invoke-static {p1, v0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    const-string v1, "session_brand_pulse"
    const-string v2, "anim"
    invoke-static {p0, v1, v2}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :done
    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V
    return-void
.end method
.method public static motion(Landroid/content/Context;)Z
    .locals 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    const-string v1, "animator_duration_scale"
    const/high16 v2, 0x3f800000
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F
    move-result v0
    const/4 v1, 0x0
    cmpl-float v0, v0, v1
    if-lez v0, :off
    const/4 v0, 0x1
    return v0
    :off
    const/4 v0, 0x0
    return v0
.end method
.method public static toggle(Lcom/melodix/music/MainActivity;Landroid/view/View;)V
    .locals 5
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    if-eqz v0, :done
    const-string v1, "sessionDetailPanel"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionSurfaceExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I
    move-result v1
    const/16 v2, 0x8
    if-nez v1, :set
    goto :apply
    :set
    const/4 v2, 0x0
    :apply
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V
    check-cast p1, Landroid/widget/TextView;
    const-string v3, "Détails techniques"
    if-nez v2, :label
    const-string v3, "Masquer les détails"
    :label
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    if-nez v2, :done
    invoke-static {p0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->motion(Landroid/content/Context;)Z
    move-result v1
    if-eqz v1, :done
    new-instance v1, Landroid/view/animation/AlphaAnimation;
    const/4 v2, 0x0
    const/high16 v3, 0x3f800000
    invoke-direct {v1, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V
    const-wide/16 v2, 0xfa
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :done
    return-void
.end method
.method public static copy(Landroid/content/Context;)V
    .locals 4
    const-string v0, "clipboard"
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/content/ClipboardManager;
    const-string v1, "Diagnostic session Melodix"
    invoke-static {}, Lcom/melodix/music/NativeSessionGate;->details()Ljava/lang/String;
    move-result-object v2
    invoke-static {v1, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    const-string v0, "Diagnostic copié"
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    return-void
.end method

# Presentation-only: only Retry, never reconnect/login/copy/disclosure actions.
.method public static retryState()V
    .locals 4
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :done
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    if-eqz v0, :done
    sget v1, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v2, 0x4
    if-eq v1, v2, :primary
    const/4 v2, 0x2
    if-ne v1, v2, :done
    const-string v1, "sessionSecondary"
    goto :button
    :primary
    const-string v1, "sessionAction"
    :button
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
    if-eqz v0, :done
    invoke-static {}, Lcom/melodix/music/NativeSessionVerificationFlight;->busy()Z
    move-result v1
    const/4 v2, 0x1
    if-eqz v1, :ready
    const-string v3, "Vérification en cours…"
    const/4 v2, 0x0
    goto :apply
    :ready
    const-string v3, "Réessayer"
    :apply
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V
    :done
    return-void
.end method
