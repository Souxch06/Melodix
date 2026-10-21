.class public final Lcom/melodix/music/NativeTextWalker;
.super Ljava/lang/Object;

.method public static apply(Landroid/view/View;Ljava/lang/String;)V
    .locals 6

    if-eqz p0, :done
    if-eqz p1, :done

    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :check_group

    move-object v0, p0
    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v1
    const-string v2, "nativeListText"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :check_placeholder
    goto :paint

    :check_placeholder
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v1
    if-eqz v1, :done
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "Chargement de votre accueil"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :done

    :paint
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-void

    :check_group
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :done
    move-object v4, p0
    check-cast v4, Landroid/view/ViewGroup;
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    const/4 v0, 0x0

    :loop
    if-ge v0, v5, :done
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static {v1, p1}, Lcom/melodix/music/NativeTextWalker;->apply(Landroid/view/View;Ljava/lang/String;)V
    add-int/lit8 v0, v0, 0x1
    goto :loop

    :done
    return-void
.end method
