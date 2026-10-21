.class public final Lcom/melodix/music/NativeRowList;
.super Ljava/lang/Object;

.method public static fillPlain(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 8

    if-eqz p1, :done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    if-eqz p2, :empty
    invoke-virtual {p2}, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :empty

    const-string v0, "\n"
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
    array-length v2, v1
    const/4 v3, 0x0

    :loop
    if-ge v3, v2, :after
    aget-object v4, v1, v3
    if-eqz v4, :next
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z
    move-result v5
    if-eqz v5, :next
    const/4 v5, -0x1
    invoke-static {p0, p1, v4, v5}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :next
    add-int/lit8 v3, v3, 0x1
    goto :loop

    :after
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done

    :empty
    const-string v6, "Chargement de votre accueil…"
    const v5, -0x4c4c4d
    invoke-static {p0, p1, v6, v5}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :done
    return-void
.end method

.method public static fill(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    if-eqz p2, :empty

    const-string v0, "\"title\""
    const-string v4, "\""
    const/4 v1, 0x0
    const/4 v8, -0x1

    :scan_loop
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v2
    if-eq v2, v8, :scan_done

    const-string v6, ":"
    invoke-virtual {p2, v6, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v3
    if-eq v3, v8, :scan_done

    add-int/lit8 v3, v3, 0x1
    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v5
    if-eq v5, v8, :scan_done

    add-int/lit8 v5, v5, 0x1
    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v3
    if-eq v3, v8, :scan_done

    invoke-virtual {p2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v9
    if-eqz v9, :scan_advance

    const/4 v9, -0x1
    invoke-static {p0, p1, v6, v9}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :scan_advance
    add-int/lit8 v1, v3, 0x1
    goto :scan_loop

    :scan_done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-lez v2, :done

    :empty
    const-string v6, "Chargement de votre accueil…"
    const v9, -0x4c4c4d
    invoke-static {p0, p1, v6, v9}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :done
    return-void
.end method

.method private static addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V
    .locals 4

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v1, 0x41800000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v1, 0x10
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, -0x1
    const/4 v3, -0x2
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method
