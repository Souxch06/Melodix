.class public final Lcom/melodix/music/NativeRowList;
.super Ljava/lang/Object;

# No try/catch: ART rejects jumps onto catch labels. Titles are pulled
# with indexOf so a JSON parse failure cannot hide the list.

.method public static fill(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 8

    if-eqz p1, :done
    if-eqz p2, :empty

    const-string v0, "\"title\""
    const/4 v1, 0x0
    const/4 v7, 0x0

    :scan_loop
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v2
    const/4 v3, -0x1
    if-eq v2, v3, :scan_done

    const-string v4, ":"
    invoke-virtual {p2, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v4
    if-eq v4, v3, :scan_done

    const-string v5, "\""
    add-int/lit8 v4, v4, 0x1
    invoke-virtual {p2, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v5
    if-eq v5, v3, :scan_done

    add-int/lit8 v6, v5, 0x1
    const-string v4, "\""
    invoke-virtual {p2, v4, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v4
    if-eq v4, v3, :scan_done

    invoke-virtual {p2, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
    move-result v5
    if-nez v5, :scan_advance

    if-eqz v7, :scan_clear
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    const/4 v7, 0x1
    :scan_clear
    const/4 v5, -0x1
    invoke-static {p0, p1, v3, v5}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :scan_advance
    add-int/lit8 v1, v4, 0x1
    goto :scan_loop

    :scan_done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done

    :empty
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    const-string v0, "Chargement de votre accueil…"
    const v1, -0x4c4c4d
    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :done
    return-void
.end method

.method private static addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V
    .locals 3

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
