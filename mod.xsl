<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">

    <xsl:template match="/root" name="wurui.order-pay">
        <xsl:param name="payurl">{paymethod}</xsl:param>
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-order-pay" ox-mod="order-pay" data-payurl="{$payurl}">
            <xsl:variable name="price" select="format-number(data/order/totalfee, '0.00')"/>
            <h3 class="payment-title">订单信息</h3>
            <div class="product">
                <h3 class="price">
                   <label class="lbl">应付金额</label>&#165;<xsl:value-of select="$price"/>
                </h3>
                <h4 class="title">
                    <label class="lbl">商品</label> <xsl:value-of select="data/order/title"/>
                </h4>
            </div>
            <h3 class="payment-title">支付方式</h3>
            <form action="{$payurl}">
                <input type="hidden" name="_id" value="{q/_id}"/>
                <input type="hidden" name="oid" value="{q/oid}"/>
                <input type="hidden" name="backurl" value="{q/backurl}"/>
                <xsl:variable name="isWeixin" select="env/client = 'weixin'"/>
                <xsl:variable name="list" select="data/options/i[not($isWeixin and value = 'weixinh5') and not($isWeixin and value = 'alipay') and not(not($isWeixin) and value = 'weixin')]"></xsl:variable>
                <ul class="payment">
                    <xsl:for-each select="$list">
                        <li>
                            <label class="pay-{value}">
                                <input type="radio" name="paymethod" value="{value}">
                                    <xsl:if test="position() = 1">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                </input>
                            </label>
                        </li>
                    </xsl:for-each>
                </ul>

                <div class="op">
                    <button class="bt-submit">确认支付
                        <big>&#165;<xsl:value-of select="$price"/>
                        </big>
                    </button>
                </div>
            </form>
        </div>
    </xsl:template>

</xsl:stylesheet>
