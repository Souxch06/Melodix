.class public final Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;


.field private final details:Landroid/widget/TextView;
.field private final toggle:Landroid/widget/TextView;


.method public constructor <init>(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;->toggle:Landroid/widget/TextView;
    iput-object p2, p0, Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;->details:Landroid/widget/TextView;
    return-void
.end method


.method public final onClick(Landroid/view/View;)V
    .locals 4

    # Collapsed by default. Opening only changes visibility: no rebuild, no
    # relayout of the whole card, and the state stays on the views themselves
    # so a re-render cannot leave the label disagreeing with the panel.
    iget-object v0, p0, Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;->details:Landroid/widget/TextView;
    if-eqz v0, :done
    iget-object v1, p0, Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;->toggle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I
    move-result v2

    if-nez v2, :expand
    const/16 v3, 0x8
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V
    if-eqz v1, :done
    const/4 v3, 0x0
    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V
    goto :done

    :expand
    const/4 v3, 0x0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V
    # 120ms fade + 2% slide on the panel's own alpha/transform: it explains the
    # change without touching layout, so it cannot block the tap or reflow the
    # card. Resolved by NAME: a rebuild renumbers resources and a hard-coded id
    # would crash with Resources$NotFoundException.
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v3
    const-string v2, "mel_disclosure_expand"
    invoke-static {v3, v2}, Lcom/melodix/music/NativeUiRowFactory;->animId(Landroid/content/Context;Ljava/lang/String;)I
    move-result v2
    if-nez v2, :no_anim
    invoke-static {v3, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    move-result-object v3
    invoke-virtual {v0, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :no_anim
    if-eqz v1, :done
    const/4 v3, 0x1
    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    :done
    return-void
.end method
